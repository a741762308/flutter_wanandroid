import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import 'bean/banner_bean.dart';
import 'bean/chapter_bean.dart';
import 'bean/project_bean.dart';
import 'http_path.dart';
import 'response/response.dart';

part 'http.g.dart';

@RestApi(baseUrl: HttpPath.HOST)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(HttpPath.WX_CHAPTERS)
  Stream<BaseResponse<List<ChapterAuthor>>> getChapterAuthor();

  @GET(HttpPath.WX_ARTICLE_LIST)
  Stream<BaseResponse<ChapterAuthorArticleResponse>> getChapterAuthorList(
      @Path("id") int id, @Path("page") int page);

  @GET(HttpPath.BANNER)
  Stream<BaseResponse<List<BannerBean>>> getBannerList();

  @GET(HttpPath.TOP_ARTICLE_LIST)
  Stream<BaseResponse<List<ChapterArticle>>> getTopChapterList();

  @GET(HttpPath.HOME_ARTICLE_LIST)
  Stream<BaseResponse<ChapterAuthorArticleResponse>> getHomeChapterList(
      @Path("page") int page);

  @GET(HttpPath.PROJECT_CLASSIFY)
  Stream<BaseResponse<List<ProjectClassify>>> getProjectClassifyList();

  @GET(HttpPath.PROJECT_LIST_LAST)
  Stream<BaseResponse<ProjectArticleResponse>> getLastProjectList(
      @Path("page") int page);

  @GET(HttpPath.PROJECT_LIST)
  Stream<BaseResponse<ProjectArticleResponse>> getProjectList(
      @Query("cid") int id, @Path("page") int page);
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
