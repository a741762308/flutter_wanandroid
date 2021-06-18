import 'package:json_annotation/json_annotation.dart';

part 'chapter.g.dart';

@JsonSerializable()
class ChapterAuthor {
  int? id;
  String? name;

  ChapterAuthor({this.id, this.name});

  factory ChapterAuthor.fromJson(Map<String, dynamic> json) =>
      _$ChapterAuthorFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterAuthorToJson(this);
}

@JsonSerializable()
class ChapterArticle {
  int? id;
  String? title;
  String? author;
  bool? collect;
  int? publishTime;
  String? link;

  ChapterArticle(
      {this.id,
      this.title,
      this.author,
      this.collect,
      this.publishTime,
      this.link});

  factory ChapterArticle.fromJson(Map<String, dynamic> json) =>
      _$ChapterArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterArticleToJson(this);
}
