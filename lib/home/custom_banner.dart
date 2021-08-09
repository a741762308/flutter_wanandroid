import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/banner_bean.dart';
import 'package:flutter_wanandroid_app/util/route_util.dart';
import 'package:flutter_wanandroid_app/widget/swiper_pagination.dart';
import 'package:html/parser.dart';

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

  Widget _customPagination(BuildContext context, SwiperPluginConfig? config) {
    Widget indicator = SwiperIndicator(alignment: Alignment.bottomRight)
        .build(context, config);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(color: Color(0x90000000)),
        width: double.infinity,
        height: 30,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Text(
                parse(widget.banners[_currentIndex].title).body?.text ?? "",
                maxLines: 1,
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.white),
              ),
            ),
            indicator
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: widget.height ?? 200,
      child: Swiper(
          index: _currentIndex,
          pagination: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig? config) {
            return _customPagination(context, config);
          }),
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
            RouteUtil.pushWebView(context, null, widget.banners[index].url);
          },
          itemCount: widget.banners.length),
    );
  }
}
