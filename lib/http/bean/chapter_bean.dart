import 'package:json_annotation/json_annotation.dart';

part 'chapter_bean.g.dart';

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
  int? chapterId;
  String? chapterName;
  int? superChapterId;
  String? superChapterName;
  String? title;
  String? desc;
  String? author;
  String? shareUser;
  bool? collect;
  int? publishTime;
  String? niceDate;
  String? link;
  List<ArticleTag>? tags;
  bool? fresh = false;
  bool top = false;

  ChapterArticle(
      {required this.id,
      required this.title,
      this.chapterId,
      this.chapterName,
      this.superChapterId,
      this.superChapterName,
      this.author,
      this.shareUser,
      this.desc,
      this.collect,
      this.publishTime,
      this.niceDate,
      required this.link,
      this.fresh,
      this.tags});

  factory ChapterArticle.fromJson(Map<String, dynamic> json) =>
      _$ChapterArticleFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterArticleToJson(this);
}

@JsonSerializable()
class ArticleTag {
  String? name;
  String? url;

  ArticleTag(this.name, this.url);

  factory ArticleTag.fromJson(Map<String, dynamic> json) =>
      _$ArticleTagFromJson(json);

  Map<String, dynamic> toJson() => _$ArticleTagToJson(this);
}
