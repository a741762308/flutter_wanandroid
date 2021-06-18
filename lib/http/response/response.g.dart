// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChapterAuthorArticleResponse _$ChapterAuthorArticleResponseFromJson(
    Map<String, dynamic> json) {
  return ChapterAuthorArticleResponse(
    curPage: json['curPage'] as int?,
    datas: (json['datas'] as List<dynamic>?)
        ?.map((e) => ChapterArticle.fromJson(e as Map<String, dynamic>))
        .toList(),
    size: json['size'] as int?,
    pageCount: json['pageCount'] as int?,
  );
}

Map<String, dynamic> _$ChapterAuthorArticleResponseToJson(
        ChapterAuthorArticleResponse instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'size': instance.size,
      'pageCount': instance.pageCount,
    };
