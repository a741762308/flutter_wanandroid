import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/project_bean.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/http/response/response.dart';
import 'package:flutter_wanandroid_app/widget/item_project.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

class ProjectListPage extends StatefulWidget {
  final int? classifyId;

  const ProjectListPage({Key? key, required this.classifyId}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProjectList();
  }
}

class _ProjectList extends State<ProjectListPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  final List<ProjectArticle> _items = [];
  final _apiService = RestClient(Dio());
  int _page = 1;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _initPageIndex();
    _getArticleList().doOnData((value) {
      print("请求到数据：data length=${value.data?.datas?.length}");
      setState(() {
        _items.clear();
        _items.addAll(value.data?.datas ?? Iterable.empty());
      });
    }).doOnError((error, stacktrace) {
      print(stacktrace);
    }).listen(null);
  }

  void _initPageIndex() {
    if (widget.classifyId == null) {
      _page = 0;
    } else {
      _page = 1;
    }
  }

  Stream<BaseResponse<ProjectArticleResponse>> _getArticleList() {
    if (widget.classifyId == null) {
      return _apiService.getLastProjectList(_page);
    }
    return _apiService.getProjectList(widget.classifyId!, _page);
  }

  void _onRefresh() {
    _initPageIndex();
    _getArticleList().doOnData((value) {
      print("请求到数据：data length=${value.data?.datas?.length}");
      setState(() {
        _items.clear();
        _items.addAll(value.data?.datas ?? Iterable.empty());
      });
      _refreshController.refreshCompleted();
    }).doOnError((error, stacktrace) {
      print(stacktrace);
      _refreshController.refreshFailed();
    }).listen(null);
  }

  void _onLoading() {
    _page++;
    _getArticleList().doOnData((value) {
      print("请求到数据：data length=${value.data?.datas?.length}");
      setState(() {
        _items.addAll(value.data?.datas ?? Iterable.empty());
      });
      _refreshController.loadComplete();
    }).doOnError((error, stacktrace) {
      print(stacktrace);
      _refreshController.loadFailed();
    }).listen(null);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: MaterialClassicHeader(),
        footer: ClassicFooter(),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
          itemBuilder: ((c, i) {
            return ProjectItem(projectArticle: _items[i]);
          }),
          itemCount: _items.length,
        ),
      ),
    );
  }
}
