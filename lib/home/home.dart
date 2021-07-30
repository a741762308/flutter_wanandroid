import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/home/custom_banner.dart';
import 'package:flutter_wanandroid_app/http/bean/banner_bean.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter_bean.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:flutter_wanandroid_app/http/response/response.dart';
import 'package:flutter_wanandroid_app/widget/item_article.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

///首页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> with AutomaticKeepAliveClientMixin {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final _apiService = RestClient(Dio());
  int _page = 1;

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
    _page = 1;
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
    _getData(null);
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
          itemBuilder: (c, i) {
            if (i == 0) {
              return Offstage(
                offstage: _banners.length == 0,
                child: CustomBanner(
                  banners: _banners,
                ),
              );
            }
            return ArticleItem(chapterArticle: _items[i - 1]);
          },
          itemCount: _items.length + 1,
        ),
      ),
    );
  }
}
