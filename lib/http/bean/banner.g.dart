// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner(
    id: json['id'] as int?,
    title: json['title'] as String?,
    imagePath: json['imagePath'] as String?,
    url: json['url'] as String?,
    desc: json['desc'] as String?,
  );
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'id': instance.id,
      'imagePath': instance.imagePath,
      'title': instance.title,
      'url': instance.url,
      'desc': instance.desc,
    };
