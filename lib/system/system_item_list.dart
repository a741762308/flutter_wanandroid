import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter_bean.dart';
import 'package:flutter_wanandroid_app/http/bean/system_bean.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/http/response/response.dart';
import 'package:flutter_wanandroid_app/widget/item_article.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

class SystemListPage extends StatefulWidget {
  final SystemTag systemTag;

  SystemListPage({Key? key, required this.systemTag}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SystemListState();
}

class _SystemListState extends State<SystemListPage>
    with AutomaticKeepAliveClientMixin {
  final List<ChapterArticle> _items = [];
  int _page = 0;
  final _apiService = RestClient(Dio());
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    _getArticleList().doOnData((value) {
      print("请求到体系列表数据：data length=${value.data?.datas?.length}");
      setState(() {
        _items.clear();
        _items.addAll(value.data?.datas ?? Iterable.empty());
      });
    }).doOnError((error, stackTrace) {
      print(stackTrace);
    }).listen(null);
  }

  Stream<BaseResponse<ChapterAuthorArticleResponse>> _getArticleList() {
    return _apiService.getSystemChapterList(widget.systemTag.id ?? 60, _page);
  }

  void _onRefresh() {
    _page = 0;
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
            return ArticleItem(chapterArticle: _items[i]);
          }),
          itemCount: _items.length,
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
