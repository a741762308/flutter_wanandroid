import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/banner.dart';
import 'package:flutter_wanandroid_app/web/web_view.dart';
import 'package:flutter_wanandroid_app/widget/swiper_pagination.dart';

class CustomBanner extends StatefulWidget {
  final List<BannerBean> banners;
  final double? height;

  CustomBanner({Key? key, required this.banners, this.height})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CustomBannerState();
  }
}

class _CustomBannerState extends State<CustomBanner> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height ?? 200,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Swiper(
              index: _currentIndex,
              pagination: SwiperIndicator(
                  alignment: Alignment.topRight,
                  builder: SwiperPagination.dots),
              itemBuilder: (context, index) {
                return CachedNetworkImage(
                  imageUrl: widget.banners[index].imagePath ?? "",
                  fit: BoxFit.fill,
                  width: double.infinity,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              },
              indicatorLayout: PageIndicatorLayout.COLOR,
              onIndexChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              onTap: (index) {
                Navigator.push(context, PageRouteBuilder(
                    pageBuilder: ((context, animation, secondaryAnimation) {
                  return SlideTransition(
                    position:
                        Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                            .animate(CurvedAnimation(
                                parent: animation,
                                curve: Curves.fastOutSlowIn)),
                    child: WebViewPage(
                      webUrl: widget.banners[index].url,
                    ),
                  );
                })));
              },
              itemCount: widget.banners.length),
          Container(
            decoration: BoxDecoration(color: Color(0x90000000)),
            width: double.infinity,
            height: 30,
            alignment: Alignment.center,
            child: Text(
              widget.banners[_currentIndex].title ?? "",
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
