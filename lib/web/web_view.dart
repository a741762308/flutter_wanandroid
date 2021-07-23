import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter.dart';

class WebViewPage extends StatefulWidget {
  final String? webUrl;
  final ChapterArticle? chapterArticle;

  WebViewPage({Key? key, required this.webUrl, this.chapterArticle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewState();
  }
}

class _WebViewState extends State<WebViewPage> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));
  late PullToRefreshController pullToRefreshController;
  double progress = 0;
  String _title = "";

  @override
  void initState() {
    super.initState();
    _title = widget.chapterArticle?.title ?? "";
    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.blue,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: null,
            automaticallyImplyLeading: true,
            title: Text(_title),
            actions: [
              widget.chapterArticle == null
                  ? Container()
                  : IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.favorite,
                          color: widget.chapterArticle?.collect ?? false
                              ? Colors.white
                              : Colors.grey),
                    ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                  ))
            ]),
        body: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                  url:
                      Uri.parse(widget.webUrl ?? "https://github.com/flutter")),
              initialOptions: options,
              pullToRefreshController: pullToRefreshController,
              onWebViewCreated: (control) {
                webViewController = control;
              },
              androidOnPermissionRequest: (control, origin, resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
              // shouldOverrideUrlLoading: (control, navigationAction) async {
              //   return NavigationActionPolicy.ALLOW;
              // },
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  pullToRefreshController.endRefreshing();
                }
                setState(() {
                  this.progress = progress / 100;
                });
              },
              onTitleChanged: (controller, title) {
                setState(() {
                  _title = title ?? "";
                });
              },
            ),
            progress < 1.0
                ? LinearProgressIndicator(value: progress)
                : Container(),
          ],
        ));
  }
}
