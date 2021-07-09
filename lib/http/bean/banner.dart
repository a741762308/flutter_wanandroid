import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class BannerBean {
  int? id;
  String? imagePath;
  String? title;
  String? url;
  String? desc;

  BannerBean({this.id, this.title, this.imagePath, this.url, this.desc});

  factory BannerBean.fromJson(Map<String, dynamic> json) =>
      _$BannerBeanFromJson(json);

  Map<String, dynamic> toJson() => _$BannerBeanToJson(this);
}
