import 'package:flutter_wanandroid_app/http/bean/chapter_bean.dart';
import 'package:flutter_wanandroid_app/http/bean/project_bean.dart';
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

@JsonSerializable()
class ProjectArticleResponse {
  int? curPage;
  List<ProjectArticle>? datas;
  int? size;
  int? pageCount;

  ProjectArticleResponse({this.curPage, this.datas, this.size, this.pageCount});

  factory ProjectArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$ProjectArticleResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectArticleResponseToJson(this);
}
