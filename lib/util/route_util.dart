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
