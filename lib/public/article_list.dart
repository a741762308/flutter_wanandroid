import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/http/response/response.dart';
import 'package:flutter_wanandroid_app/web/web_view.dart';
import 'package:like_button/like_button.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ArticleListPage extends StatefulWidget {
  final int authorId;

  const ArticleListPage({Key? key, required this.authorId}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      _ArticleListState(authorId: this.authorId);
}

class _ArticleListState extends State<ArticleListPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final List<ChapterArticle> _items = [
    ChapterArticle(author: "航洋", title: "RecyclerView 中的秘密探索，起飞 Fling ~"),
    ChapterArticle(author: "过滤", title: "RecyclerView 中的秘密探索，起飞 Fling ~")
  ];
  int _page = 1;

  _ArticleListState({required int authorId});

  @override
  void initState() {
    super.initState();
    getArticleList().then((value) {
      print("请求到数据：data length=${value.data?.datas?.length}");
      setState(() {
        _items.clear();
        _items.addAll(value.data?.datas ?? Iterable.empty());
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<BaseResponse<ChapterAuthorArticleResponse>> getArticleList() async {
    return RestClient(Dio()).getChapterAuthorList(widget.authorId, _page);
  }

  void _onRefresh() async {
    _page = 1;
    getArticleList().then((value) {
      print("请求到数据：data length=${value.data?.datas?.length}");
      setState(() {
        _items.clear();
        _items.addAll(value.data?.datas ?? Iterable.empty());
      });
      _refreshController.refreshCompleted();
    }).catchError((e) {
      print(e);
      _refreshController.refreshFailed();
    });
  }

  void _onLoading() async {
    _page++;
    getArticleList().then((value) {
      print("请求到数据：data length=${value.data?.datas?.length}");
      setState(() {
        _items.addAll(value.data?.datas ?? Iterable.empty());
      });
      _refreshController.loadComplete();
    }).catchError((e) {
      print(e);
      _refreshController.loadFailed();
    });
  }

  @override
  Widget build(BuildContext context) {
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
            return _ArticleItem(chapterArticle: _items[i]);
          }),
          itemCount: _items.length,
          itemExtent: 100,
        ),
      ),
    );
  }
}

class _ArticleItem extends StatefulWidget {
  final ChapterArticle chapterArticle;

  const _ArticleItem({Key? key, required this.chapterArticle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ArticleItemState();
  }
}

class _ArticleItemState extends State<_ArticleItem> {
  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onArticleLikeChange(bool isLike) async {
    return !isLike;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.chapterArticle.title ?? ""),
                  LikeButton(
                    likeBuilder: (isLike) {
                      return Icon(Icons.favorite,
                          color: isLike
                              ? Theme.of(context).primaryColor
                              : Colors.grey);
                    },
                    onTap: _onArticleLikeChange,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.chapterArticle.author ?? ""),
                    Text("1111")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) {
          return WebViewPage(webUrl: widget.chapterArticle.link);
        })));
      },
    );
  }
}
