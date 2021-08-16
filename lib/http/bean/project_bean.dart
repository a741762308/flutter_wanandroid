import 'package:json_annotation/json_annotation.dart';

import 'chapter_bean.dart';

part 'project_bean.g.dart';

@JsonSerializable()
class ProjectClassify {
  int? id;
  int? courseId;
  String? name;
  int? parentChapterId;

  ProjectClassify(
      {required this.id, this.courseId, this.name, this.parentChapterId});

  factory ProjectClassify.fromJson(Map<String, dynamic> json) =>
      _$ProjectClassifyFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectClassifyToJson(this);
}

@JsonSerializable()
class ProjectArticle extends ChapterArticle {
  String? envelopePic;
  String? projectLink;

  ProjectArticle(
      {int? id,
      String? title,
      String? link,
      this.envelopePic,
      this.projectLink})
      : super(id: id, title: title, link: link);

  factory ProjectArticle.fromJson(Map<String, dynamic> json) =>
      _$ProjectArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectArticleToJson(this);
}
