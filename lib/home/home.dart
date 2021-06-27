import 'package:flutter/material.dart' hide Banner;
import 'package:card_swiper/card_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_wanandroid_app/http/bean/banner.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///首页
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<Banner> _banners = [
    Banner(
        id: 29,
        imagePath:
            "https://wanandroid.com/blogimgs/31c2394c-b07c-4699-afd1-95aa7a3bebc6.png",
        title:
            "View 嵌套太深会卡？来用 Jetpack Compose，随便套&mdash;&mdash;Compose 的 Intrinsic Measurement"),
  ];

  void _onRefresh() async {}

  void _onLoading() async {}

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
              return Swiper(
                itemBuilder: (context, index) {
                  return CachedNetworkImage(
                    imageUrl: _banners[index].imagePath ?? "",
                    fit: BoxFit.fill,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  );
                },
                itemCount: _banners.length,
              );
            }
            return Container();
          },
          itemCount: _banners.length,
          itemExtent: 100,
        ),
      ),
    );
  }
}
