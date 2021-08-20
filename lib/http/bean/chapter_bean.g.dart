// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterAuthor _$ChapterAuthorFromJson(Map<String, dynamic> json) {
  return ChapterAuthor(
    id: json['id'] as int?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$ChapterAuthorToJson(ChapterAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

ChapterArticle _$ChapterArticleFromJson(Map<String, dynamic> json) {
  return ChapterArticle(
    id: json['id'] as int?,
    title: json['title'] as String?,
    chapterId: json['chapterId'] as int?,
    chapterName: json['chapterName'] as String?,
    superChapterId: json['superChapterId'] as int?,
    superChapterName: json['superChapterName'] as String?,
    author: json['author'] as String?,
    shareUser: json['shareUser'] as String?,
    desc: json['desc'] as String?,
    collect: json['collect'] as bool?,
    publishTime: json['publishTime'] as int?,
    niceDate: json['niceDate'] as String?,
    link: json['link'] as String?,
    fresh: json['fresh'] as bool?,
    tags: (json['tags'] as List<dynamic>?)
        ?.map((e) => ArticleTag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ChapterArticleToJson(ChapterArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'title': instance.title,
      'desc': instance.desc,
      'author': instance.author,
      'shareUser': instance.shareUser,
      'collect': instance.collect,
      'publishTime': instance.publishTime,
      'niceDate': instance.niceDate,
      'link': instance.link,
      'tags': instance.tags,
      'fresh': instance.fresh,
    };

ArticleTag _$ArticleTagFromJson(Map<String, dynamic> json) {
  return ArticleTag(
    json['name'] as String?,
    json['url'] as String?,
  );
}

Map<String, dynamic> _$ArticleTagToJson(ArticleTag instance) =>
    <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
    };
