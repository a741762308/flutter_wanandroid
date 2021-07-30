import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter_bean.dart';
import 'package:flutter_wanandroid_app/web/web_view.dart';
import 'package:like_button/like_button.dart';

class ArticleItem extends StatefulWidget {
  final ChapterArticle chapterArticle;

  const ArticleItem({Key? key, required this.chapterArticle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ArticleItemState();
  }
}

class _ArticleItemState extends State<ArticleItem> {
  RegExp _dateRegExp = RegExp(
      r'^\d{4}[\-\/\.]((0[1-9])|(1[012]))[\-\/\.]((0[1-9]|[1-2][0-9]|3[0-1]))');

  String _dateString(String? dateString) {
    if (dateString == null) {
      return "";
    }
    String date = dateString;
    return _dateRegExp.stringMatch(date) ?? date;
  }

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _onArticleLikeChange(bool isLike) async {
    return !isLike;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  Offstage(
                    offstage: widget.chapterArticle.top == false,
                    child: Container(
                      child: Text(
                        "置顶",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(widget.chapterArticle.title ?? ""),
                  ),
                  LikeButton(
                    likeBuilder: (isLike) {
                      return Icon(Icons.favorite,
                          color: isLike
                              ? Theme.of(context).primaryColor
                              : Colors.grey);
                    },
                    onTap: _onArticleLikeChange,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.chapterArticle.author?.isNotEmpty == true
                        ? widget.chapterArticle.author ?? ""
                        : widget.chapterArticle.shareUser ?? ""),
                    Text(_dateString(widget.chapterArticle.niceDate))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: ((context) {
          return WebViewPage(
            webUrl: widget.chapterArticle.link,
            chapterArticle: widget.chapterArticle,
          );
        })));
      },
    );
  }
}
