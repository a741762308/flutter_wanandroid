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
  List<ProjectClassify> _tabs = [ProjectClassify(id: null, name: "最新项目")];
  TabController? _tabController;
  final _apiService = RestClient(Dio());

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
    _apiService.getProjectClassifyList().doOnData((value) {
      print("请求到项目数据：data length=${value.data?.length}");
      int length = value.data?.length ?? 0;
      _tabController = TabController(length: length + 1, vsync: this);
      setState(() {
        _tabs.clear();
        _tabs.add(ProjectClassify(id: null, name: "最新项目"));
        _tabs.addAll(value.data ?? Iterable.empty());
      });
    }).doOnError((error, stackTrace) {
      print(stackTrace);
    }).listen(null);
  }

  @override
  Widget build(BuildContext context) {
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
            isScrollable: _tabs.length > 5,
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
        children: _tabs.map((e) => ProjectListPage(classifyId: e.id)).toList(),
        controller: _tabController,
      ),
    );
  }
}
