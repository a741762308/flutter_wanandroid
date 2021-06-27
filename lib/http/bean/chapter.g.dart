// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

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
    author: json['author'] as String?,
    collect: json['collect'] as bool?,
    publishTime: json['publishTime'] as int?,
    niceDate: json['niceDate'] as String?,
    link: json['link'] as String?,
  );
}

Map<String, dynamic> _$ChapterArticleToJson(ChapterArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'collect': instance.collect,
      'publishTime': instance.publishTime,
      'niceDate': instance.niceDate,
      'link': instance.link,
    };
