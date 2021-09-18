import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/home/custom_banner.dart';
import 'package:flutter_wanandroid_app/http/bean/banner_bean.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter_bean.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/http/response/response.dart';
import 'package:flutter_wanandroid_app/search/search.dart';
import 'package:flutter_wanandroid_app/util/route_util.dart';
import 'package:flutter_wanandroid_app/widget/item_article.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

///首页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> with AutomaticKeepAliveClientMixin {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final double _bannerHeight = 200;
  final double _barHeight = 48;
  late ScrollController _scrollController = ScrollController();
  bool _showTop = false;
  final _apiService = RestClient(Dio());
  int _page = 0;

  List<BannerBean> _banners = [
    BannerBean(
        id: 29,
        imagePath:
            "https://wanandroid.com/blogimgs/31c2394c-b07c-4699-afd1-95aa7a3bebc6.png",
        title:
            "View 嵌套太深会卡？来用 Jetpack Compose，随便套&mdash;&mdash;Compose 的 Intrinsic Measurement"),
    BannerBean(
        id: 10,
        imagePath:
            "https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
        title: "一起来做个App吧"),
  ];
  List<ChapterArticle> _items = [];

  void _onRefresh() {
    _page = 0;
    _getData((bool) {
      if (bool) {
        _refreshController.refreshCompleted();
      } else {
        _refreshController.refreshFailed();
      }
    });
  }

  void _onLoading() {
    _page++;
    _apiService.getHomeChapterList(_page).doOnData((value) {
      setState(() {
        _items.addAll(value.data?.datas ?? Iterable.empty());
      });
      _refreshController.loadComplete();
    }).doOnError((error, stacktrace) {
      print(stacktrace);
      _refreshController.loadFailed();
    }).listen(null);
  }

  _getData(Function(bool)? function) {
    var banner = _apiService.getBannerList();
    var top = _apiService.getTopChapterList();
    var article = _apiService.getHomeChapterList(_page);
    Rx.zip3(banner, top, article,
        (BaseResponse<List<BannerBean>> bannerResponse,
            BaseResponse<List<ChapterArticle>> topResponse,
            BaseResponse<ChapterAuthorArticleResponse> articleResponse) {
      print("请求到Banner数据：data length=${bannerResponse.data?.length}");
      print("请求到置顶文章数据：data length=${topResponse.data?.length}");
      print("请求到文章数据：data length=${articleResponse.data?.datas?.length}");
      topResponse.data?.forEach((element) {
        element.top = true;
      });
      setState(() {
        _banners.clear();
        _banners.addAll(bannerResponse.data ?? Iterable.empty());
        _items.clear();
        _items.addAll(topResponse.data ?? Iterable.empty());
        _items.addAll(articleResponse.data?.datas ?? Iterable.empty());
      });
      function?.call(true);
    }).doOnError((error, stacktrace) {
      print(stacktrace);
      function?.call(false);
    }).listen(null);
  }

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      var offset = _scrollController.offset;
      var height = _bannerHeight - _barHeight;
      if (offset > height && !_showTop) {
        setState(() {
          _showTop = true;
        });
      } else if (offset < height && _showTop) {
        setState(() {
          _showTop = false;
        });
      }
    });
    _getData(null);
  }

  _scrollTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 300), curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: false,
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          enablePullUp: true,
          header: MaterialClassicHeader(),
          footer: ClassicFooter(),
          onRefresh: _onRefresh,
          onLoading: _onLoading,
          child: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(),
              SliverAppBar(
                  leading: Offstage(
                    offstage: !_showTop,
                    child: IconButton(
                      icon: Icon(Icons.dehaze),
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                  ),
                  title: Offstage(
                    offstage: !_showTop,
                    child: Text("Wan Android"),
                  ),
                  actions: [
                    Offstage(
                      offstage: !_showTop,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.search)),
                    ),
                  ],
                  pinned: true,
                  // floating: true,
                  // primary: true,
                  // snap: true,
                  toolbarHeight: _barHeight,
                  elevation: 0,
                  expandedHeight: _bannerHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: CustomBanner(
                      banners: _banners,
                      height: _bannerHeight,
                    ),
                  )),
              SliverList(
                delegate: SliverChildBuilderDelegate((c, i) {
                  return ArticleItem(chapterArticle: _items[i]);
                }, childCount: _items.length),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(_showTop ? Icons.vertical_align_top : Icons.search),
        onPressed: () {
          if (_showTop) {
            _scrollTop();
          } else {
            Navigator.of(context).push(AlphaRouteZoom(SearchPage()));
          }
        },
      ),
    );
  }
}
