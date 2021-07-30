import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter_bean.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/http/response/response.dart';
import 'package:flutter_wanandroid_app/widget/item_article.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

class ArticleListPage extends StatefulWidget {
  final int authorId;

  const ArticleListPage({Key? key, required this.authorId}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _ArticleListState(authorId: this.authorId);
}

class _ArticleListState extends State<ArticleListPage>
    with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final List<ChapterArticle> _items = [
    ChapterArticle(
        id: 0, author: "航洋", title: "RecyclerView 中的秘密探索，起飞 Fling ~", link: ""),
    ChapterArticle(
        id: 1, author: "过滤", title: "RecyclerView 中的秘密探索，起飞 Fling ~", link: "")
  ];
  int _page = 1;
  final _apiService = RestClient(Dio());

  _ArticleListState({required int authorId});

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
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

  Stream<BaseResponse<ChapterAuthorArticleResponse>> _getArticleList() {
    return _apiService.getChapterAuthorList(widget.authorId, _page);
  }

  void _onRefresh() {
    _page = 1;
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
          itemExtent: 100,
        ),
      ),
    );
  }
}
