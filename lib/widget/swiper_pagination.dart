import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class SwiperIndicator extends SwiperPagination {
  const SwiperIndicator(
      {Key? key,
      Alignment? alignment = Alignment.bottomCenter,
      EdgeInsetsGeometry margin = const EdgeInsets.all(10.0),
      SwiperPlugin builder = SwiperPagination.dots})
      : super(alignment: alignment, key: key, margin: margin, builder: builder);

  @override
  Widget build(BuildContext context, SwiperPluginConfig? config) {
    final _alignment = alignment ??
        (config!.scrollDirection == Axis.horizontal
            ? Alignment.bottomCenter
            : Alignment.centerRight);
    Widget child = Container(
      margin: margin,
      child: builder.build(context, config!),
    );
    if (!config.outer!) {
      child = Align(
        key: key,
        alignment: _alignment,
        child: child,
      );
    }
    return child;
  }
}
