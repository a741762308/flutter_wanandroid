import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter_bean.dart';
import 'package:flutter_wanandroid_app/http/bean/search_bean.dart';
import 'package:flutter_wanandroid_app/util/flutter_util.dart';
import 'package:flutter_wanandroid_app/widget/item_article.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchState();
}

class _SearchState extends State<SearchPage> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  bool _loadMore = false;
  List<SearchKey> _hotKey = [SearchKey(id: 6, name: "面试")];
  List<ChapterArticle> _items = [];

  @override
  void initState() {
    super.initState();
  }

  _onLoading() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SmartRefresher(
      controller: _refreshController,
      enablePullUp: _loadMore,
      enablePullDown: false,
      onLoading: _onLoading,
      child: ListView.builder(
        itemBuilder: ((c, i) {
          if (!_loadMore && i == 0) {
            return Wrap(
              spacing: 10,
              runSpacing: 10,
              children: _hotKey.map((e) {
                return InkWell(
                  onTap: () {},
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(3),
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      color: FlutterUtil.nameColor(e.name ?? "a"),
                      child: Text(
                        e.name ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          }
          return ArticleItem(
            chapterArticle: _items[i - 1],
          );
        }),
        itemCount: _loadMore ? _items.length : _items.length + 1,
      ),
    ));
  }
}
