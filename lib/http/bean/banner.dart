import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable()
class Banner {
  int? id;
  String? imagePath;
  String? title;
  String? url;
  String? desc;

  Banner({this.id, this.title, this.imagePath, this.url, this.desc});

  factory Banner.fromJson(Map<String, dynamic> json) =>
      _$BannerFromJson(json);

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}
