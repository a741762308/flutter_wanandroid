// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectClassify _$ProjectClassifyFromJson(Map<String, dynamic> json) {
  return ProjectClassify(
    id: json['id'] as int?,
    courseId: json['courseId'] as int?,
    name: json['name'] as String?,
    parentChapterId: json['parentChapterId'] as int?,
  );
}

Map<String, dynamic> _$ProjectClassifyToJson(ProjectClassify instance) =>
    <String, dynamic>{
      'id': instance.id,
      'courseId': instance.courseId,
      'name': instance.name,
      'parentChapterId': instance.parentChapterId,
    };

ProjectArticle _$ProjectArticleFromJson(Map<String, dynamic> json) {
  return ProjectArticle(
    id: json['id'] as int?,
    title: json['title'] as String?,
    link: json['link'] as String?,
    envelopePic: json['envelopePic'] as String?,
    projectLink: json['projectLink'] as String?,
  )
    ..chapterId = json['chapterId'] as int?
    ..chapterName = json['chapterName'] as String?
    ..superChapterId = json['superChapterId'] as int?
    ..superChapterName = json['superChapterName'] as String?
    ..desc = json['desc'] as String?
    ..author = json['author'] as String?
    ..shareUser = json['shareUser'] as String?
    ..collect = json['collect'] as bool?
    ..publishTime = json['publishTime'] as int?
    ..niceDate = json['niceDate'] as String?
    ..tags = (json['tags'] as List<dynamic>?)
        ?.map((e) => ArticleTag.fromJson(e as Map<String, dynamic>))
        .toList()
    ..fresh = json['fresh'] as bool?;
}

Map<String, dynamic> _$ProjectArticleToJson(ProjectArticle instance) =>
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
      'envelopePic': instance.envelopePic,
      'projectLink': instance.projectLink,
    };
