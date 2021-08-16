import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wanandroid_app/http/bean/project_bean.dart';
import 'package:flutter_wanandroid_app/util/flutter_util.dart';
import 'package:flutter_wanandroid_app/web/web_view.dart';
import 'package:html/parser.dart';
import 'package:like_button/like_button.dart';

class ProjectItem extends StatefulWidget {
  final ProjectArticle projectArticle;

  const ProjectItem({Key? key, required this.projectArticle}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProjectItemState();
}

class _ProjectItemState extends State<ProjectItem> {
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
            child: SizedBox(
              height: 128,
              child: Row(
                children: [
                  Offstage(
                    offstage: widget.projectArticle.envelopePic == null,
                    child: CachedNetworkImage(
                      imageUrl: widget.projectArticle.envelopePic ?? "",
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.only(left: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            children: [
                              Text(
                                parse(widget.projectArticle.title).body?.text ??
                                    "",
                                maxLines: 2,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Text(
                                  parse(widget.projectArticle.desc)
                                          .body
                                          ?.text ??
                                      "",
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.black26, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text((widget.projectArticle.author?.isNotEmpty ==
                                          true
                                      ? widget.projectArticle.author ?? ""
                                      : widget.projectArticle.shareUser ?? "") +
                                  "  " +
                                  FlutterUtil.dateString(
                                      widget.projectArticle.niceDate)),
                              LikeButton(
                                likeBuilder: (isLike) {
                                  return Icon(Icons.favorite,
                                      color: isLike
                                          ? Theme.of(context).primaryColor
                                          : Colors.grey);
                                },
                                onTap: _onArticleLikeChange,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      onTap: () {
        Navigator.push(context, CupertinoPageRoute(builder: ((context) {
          return WebViewPage(
            webUrl: widget.projectArticle.link,
            chapterArticle: widget.projectArticle,
          );
        })));
      },
    );
  }
}
