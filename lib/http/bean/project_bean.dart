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

class ProjectArticle extends ChapterArticle {
  ProjectArticle(int? id, String? title) : super(id, title);
}
