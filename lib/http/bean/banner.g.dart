// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BannerBean _$BannerBeanFromJson(Map<String, dynamic> json) {
  return BannerBean(
    id: json['id'] as int?,
    title: json['title'] as String?,
    imagePath: json['imagePath'] as String?,
    url: json['url'] as String?,
    desc: json['desc'] as String?,
  );
}

Map<String, dynamic> _$BannerBeanToJson(BannerBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'url': instance.url,
      'desc': instance.desc,
    };
