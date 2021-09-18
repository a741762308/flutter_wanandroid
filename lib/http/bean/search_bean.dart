import 'package:json_annotation/json_annotation.dart';

part 'search_bean.g.dart';

@JsonSerializable()
class SearchKey {
  int? id;
  String? link;
  String? name;
  int? order;
  int? visible;

  SearchKey({this.id, this.link, this.name, this.order, this.visible});

  factory SearchKey.fromJson(Map<String, dynamic> json) =>
      _$SearchKeyFromJson(json);

  Map<String, dynamic> toJson() => _$SearchKeyToJson(this);
}
