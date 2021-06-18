import 'package:dio/dio.dart';
import 'package:flutter_wanandroid_app/http/bean/chapter.dart';
import 'package:flutter_wanandroid_app/http/response/response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'http.g.dart';

@RestApi(baseUrl: "https://wanandroid.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/wxarticle/chapters/json')
  Future<BaseResponse<List<ChapterAuthor>>> getChapterAuthor();

  @GET("/wxarticle/list/{id}/{page}/json")
  Future<BaseResponse<ChapterAuthorArticleResponse>> getChapterAuthorList(
      @Path("id") int id, @Path("page") int page);
}

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  int? code;
  String? msg;
  T? data;

  BaseResponse({this.code, this.msg, this.data});

  factory BaseResponse.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$BaseResponseFromJson(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson(this, toJsonT);
}

void main() {
  final dio = Dio();
  final api = RestClient(dio);
  api.getChapterAuthorList(408, 1).then((it) {
    print("请求到数据：data length=${it.data?.datas?.length}");
  }).catchError((it) {
    print(it);
  });
}
