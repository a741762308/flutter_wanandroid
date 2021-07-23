import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/public/article_list.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

/// 微信公众号
class WechatPublicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabBarState();
}

class _TabBarState extends State<WechatPublicPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final List<ChapterAuthor> _tabs = [ChapterAuthor(id: 408, name: "张鸿洋")];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    RestClient(Dio()).getChapterAuthor().doOnData((value) {
      print("请求到数据：data length=${value.data?.length}");
      _tabController =
          TabController(length: value.data?.length ?? 0, vsync: this);
      setState(() {
        _tabs.clear();
        _tabs.addAll(value.data ?? Iterable.empty());
      });
    }).doOnError((error, stacktrace) {
      print(stacktrace);
    }).listen(null);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
            flexibleSpace: SafeArea(
          child: TabBar(
            tabs: _tabs.map((e) {
              return SizedBox(
                height: 30,
                child: Text(e.name ?? ""),
              );
            }).toList(),
            controller: _tabController,
            isScrollable: _tabs.length > 5 ? true : false,
            indicator: MaterialIndicator(
                height: 2.5,
                color: Colors.white,
                bottomLeftRadius: 5,
                bottomRightRadius: 5),
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: TextStyle(fontSize: 18),
            indicatorPadding: EdgeInsets.fromLTRB(0, 2, 0, 2),
          ),
        )),
        preferredSize: Size(double.infinity, 33),
      ),
      body: TabBarView(
          children: _tabs.map((e) {
            return ArticleListPage(authorId: e.id ?? 408);
          }).toList(),
          controller: _tabController),
    );
  }
}
