import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'package:dio/dio.dart';
import 'package:flutter_wanandroid_app/http/bean/banner.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter.dart';
import 'package:flutter_wanandroid_app/http/response/response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'http.g.dart';

@RestApi(baseUrl: "https://wanandroid.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/wxarticle/chapters/json')
  Stream<BaseResponse<List<ChapterAuthor>>> getChapterAuthor();

  @GET("/wxarticle/list/{id}/{page}/json")
  Stream<BaseResponse<ChapterAuthorArticleResponse>> getChapterAuthorList(
      @Path("id") int id, @Path("page") int page);

  @GET("/banner/json")
  Stream<BaseResponse<List<BannerBean>>> getBannerList();
}

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  int? code;
  String? msg;
  T? data;

  BaseResponse({this.code, this.msg, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json,
      T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

void main() {

  RegExp regExp = RegExp(r'cos.(.+).myqcloud');
  RegExpMatch? match = regExp.firstMatch(
      "http://web-sit-1257884527.cos.ap-guangzhou.myqcloud.com/h5/2021-06-24/78490587-2b9a-4a86-8544-08cbbf6cd584default.jpg");
  // print(match?.group(1));
  print(utf8.encode(")O[NB]6,YF}+efca"));
  // RegExp _dateRegExp = RegExp(
  //     r'^\d{4}[\-\/\.]((0[1-9])|(1[012]))[\-\/\.]((0[1-9]|[1-2][0-9]|3[0-1]))');
  // print(_dateRegExp.stringMatch('2020.03.31'));
  // final dio = Dio();
  // final api = RestClient(dio);
  // api.getChapterAuthorList(408, 1).then((it) {
  //   print("请求到数据：data length=${it.data?.datas?.length}");
  // }).catchError((it) {
  //   print(it);
  // });
}
