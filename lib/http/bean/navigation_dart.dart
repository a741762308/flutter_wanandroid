import 'package:json_annotation/json_annotation.dart';

import 'chapter_bean.dart';

part 'navigation_dart.g.dart';

@JsonSerializable()
class NavigationBean {
  int? cid;
  String? name;
  List<NavigationTag>? articles;

  NavigationBean({required this.cid, this.name, this.articles});

  factory NavigationBean.fromJson(Map<String, dynamic> json) =>
      _$NavigationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationBeanToJson(this);
}

@JsonSerializable()
class NavigationTag extends ChapterArticle {
  NavigationTag(int id, String title, String chapterName, String link)
      : super(id: id, title: title, chapterName: chapterName, link: link);

  factory NavigationTag.fromJson(Map<String, dynamic> json) =>
      _$NavigationTagFromJson(json);

  Map<String, dynamic> toJson() => _$NavigationTagToJson(this);
}
