import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/project_bean.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/project/project_list.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

///项目
class ProjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProjectState();
  }
}

class _ProjectState extends State<ProjectPage> with TickerProviderStateMixin {
  List<ProjectClassify> _tabs = [];
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    RestClient(Dio()).getProjectClassifyList().doOnData((value) {
      print("请求到数据：data length=${value.data?.length}");
      _tabController =
          TabController(length: value.data?.length ?? 0, vsync: this);
      setState(() {
        _tabs.clear();
        _tabs.addAll(value.data ?? Iterable.empty());
      });
    }).doOnError((error, stackTrace) {
      print(stackTrace);
    }).listen(null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 33,
            color: Theme.of(context).primaryColor,
            child: TabBar(
              tabs: _tabs.map((e) => Text(e.name ?? "1111")).toList(),
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
          ),
          Expanded(
              child: TabBarView(
            children: _tabs.map((e) => ProjectListPage()).toList(),
            controller: _tabController,
          )),
        ],
      ),
    );
  }
}
