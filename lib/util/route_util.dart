import 'package:flutter/cupertino.dart';
import 'package:flutter_wanandroid_app/web/web_view.dart';

class RouteUtil {
  static void pushWebView(BuildContext context, String? title, String? url) {
    Navigator.push(context, CupertinoPageRoute(builder: ((context) {
      return WebViewPage(
        webUrl: url,
      );
    })));
  }
}

///淡入淡出
class AlphaRouteZoom extends PageRouteBuilder {
  final Widget widget;

  AlphaRouteZoom(this.widget)
      : super(
            transitionDuration: const Duration(microseconds: 800),
            pageBuilder: (ctx, a1, a2) {
              return widget;
            },
            transitionsBuilder: (ctx, a1, a2, child) {
              return FadeTransition(
                opacity: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(parent: a1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

///缩放
class ScaleRouteZoom extends PageRouteBuilder {
  final Widget widget;

  ScaleRouteZoom(this.widget)
      : super(
            transitionDuration: const Duration(microseconds: 600),
            pageBuilder: (ctx, a1, a2) {
              return widget;
            },
            transitionsBuilder: (ctx, a1, a2, child) {
              return ScaleTransition(
                scale: Tween(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(parent: a1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}

///右滑进入
class SlideRouteZoom extends PageRouteBuilder {
  final Widget widget;

  SlideRouteZoom(this.widget)
      : super(
            transitionDuration: const Duration(microseconds: 400),
            pageBuilder: (ctx, a1, a2) {
              return widget;
            },
            transitionsBuilder: (ctx, a1, a2, child) {
              return SlideTransition(
                position: Tween<Offset>(
                        begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(CurvedAnimation(
                        parent: a1, curve: Curves.fastOutSlowIn)),
                child: child,
              );
            });
}
