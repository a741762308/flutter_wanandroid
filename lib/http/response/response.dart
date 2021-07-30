import 'package:flutter_wanandroid_app/http/bean/chapter_bean.dart';
import 'package:json_annotation/json_annotation.dart';

part 'response.g.dart';

@JsonSerializable()
class ChapterAuthorArticleResponse {
  int? curPage;
  List<ChapterArticle>? datas;
  int? size;
  int? pageCount;

  ChapterAuthorArticleResponse(
      {this.curPage, this.datas, this.size, this.pageCount});

  factory ChapterAuthorArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ChapterAuthorArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterAuthorArticleResponseToJson(this);
}
