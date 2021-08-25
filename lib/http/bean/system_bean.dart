import 'package:json_annotation/json_annotation.dart';

part 'system_bean.g.dart';

@JsonSerializable()
class SystemBean {
  int? courseId;
  int? id;
  String? name;
  List<SystemTag>? children;

  SystemBean({required this.id, this.courseId, this.name, this.children});

  factory SystemBean.fromJson(Map<String, dynamic> json) =>
      _$SystemBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SystemBeanToJson(this);
}

@JsonSerializable()
class SystemTag {
  int? id;
  String? name;

  SystemTag({required this.id, this.name});

  factory SystemTag.fromJson(Map<String, dynamic> json) =>
      _$SystemTagFromJson(json);

  Map<String, dynamic> toJson() => _$SystemTagToJson(this);
}
