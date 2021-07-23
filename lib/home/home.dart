import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/home/custom_banner.dart';
import 'package:flutter_wanandroid_app/http/bean/banner.dart';
import 'package:flutter_wanandroid_app/http/http.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:rxdart/rxdart.dart';

///首页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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

  void _onRefresh() async {}

  void _onLoading() async {}

  @override
  void initState() {
    super.initState();
    RestClient(Dio()).getBannerList().doOnData((value) {
      print("请求到数据：data length=${value.data?.length}");
      setState(() {
        _banners.clear();
        _banners.addAll(value.data ?? Iterable.empty());
      });
    }).doOnError((error, stacktrace) {
      print(error);
    }).listen(null);
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
          itemBuilder: (c, i) {
            if (i == 0) {
              return CustomBanner(
                banners: _banners,
              );
            }
            return Container();
          },
          itemCount: _banners.length,
        ),
      ),
    );
  }
}
