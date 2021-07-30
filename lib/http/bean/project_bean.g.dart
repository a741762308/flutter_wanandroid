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

