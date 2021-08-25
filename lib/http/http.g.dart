// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'http.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) {
  return BaseResponse<T>(
    code: json['code'] as int?,
    msg: json['msg'] as String?,
    data: _$nullableGenericFromJson(json['data'], fromJsonT),
  );
}

Map<String, dynamic> _$BaseResponseToJson<T>(
  BaseResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://wanandroid.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Stream<BaseResponse<List<ChapterAuthor>>> getChapterAuthor() async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<ChapterAuthor>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/wxarticle/chapters/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<ChapterAuthor>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<ChapterAuthor>(
                (i) => ChapterAuthor.fromJson(i as Map<String, dynamic>))
            .toList());
    yield value;
  }

  @override
  Stream<BaseResponse<ChapterAuthorArticleResponse>> getChapterAuthorList(
      id, page) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ChapterAuthorArticleResponse>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/wxarticle/list/$id/$page/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ChapterAuthorArticleResponse>.fromJson(
      _result.data!,
      (json) =>
          ChapterAuthorArticleResponse.fromJson(json as Map<String, dynamic>),
    );
    yield value;
  }

  @override
  Stream<BaseResponse<List<BannerBean>>> getBannerList() async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<BannerBean>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/banner/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<BannerBean>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<BannerBean>(
                (i) => BannerBean.fromJson(i as Map<String, dynamic>))
            .toList());
    yield value;
  }

  @override
  Stream<BaseResponse<List<ChapterArticle>>> getTopChapterList() async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<ChapterArticle>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/article/top/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<ChapterArticle>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<ChapterArticle>(
                (i) => ChapterArticle.fromJson(i as Map<String, dynamic>))
            .toList());
    yield value;
  }

  @override
  Stream<BaseResponse<ChapterAuthorArticleResponse>> getHomeChapterList(
      page) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ChapterAuthorArticleResponse>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/article/list/$page/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ChapterAuthorArticleResponse>.fromJson(
      _result.data!,
      (json) =>
          ChapterAuthorArticleResponse.fromJson(json as Map<String, dynamic>),
    );
    yield value;
  }

  @override
  Stream<BaseResponse<List<ProjectClassify>>> getProjectClassifyList() async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<ProjectClassify>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/project/tree/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<ProjectClassify>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<ProjectClassify>(
                (i) => ProjectClassify.fromJson(i as Map<String, dynamic>))
            .toList());
    yield value;
  }

  @override
  Stream<BaseResponse<ProjectArticleResponse>> getLastProjectList(page) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ProjectArticleResponse>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/article/listproject/$page/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ProjectArticleResponse>.fromJson(
      _result.data!,
      (json) => ProjectArticleResponse.fromJson(json as Map<String, dynamic>),
    );
    yield value;
  }

  @override
  Stream<BaseResponse<ProjectArticleResponse>> getProjectList(id, page) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'cid': id};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ProjectArticleResponse>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/project/list/$page/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ProjectArticleResponse>.fromJson(
      _result.data!,
      (json) => ProjectArticleResponse.fromJson(json as Map<String, dynamic>),
    );
    yield value;
  }

  @override
  Stream<BaseResponse<List<NavigationBean>>> getNavigation() async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<NavigationBean>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/navi/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<NavigationBean>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<NavigationBean>(
                (i) => NavigationBean.fromJson(i as Map<String, dynamic>))
            .toList());
    yield value;
  }

  @override
  Stream<BaseResponse<List<SystemBean>>> getSystemClassifyList() async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<List<SystemBean>>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/tree/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<List<SystemBean>>.fromJson(
        _result.data!,
        (json) => (json as List<dynamic>)
            .map<SystemBean>(
                (i) => SystemBean.fromJson(i as Map<String, dynamic>))
            .toList());
    yield value;
  }

  @override
  Stream<BaseResponse<ChapterAuthorArticleResponse>> getSystemChapterList(
      id, page) async* {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'cid': id};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ChapterAuthorArticleResponse>>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/article/list/$page/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ChapterAuthorArticleResponse>.fromJson(
      _result.data!,
      (json) =>
          ChapterAuthorArticleResponse.fromJson(json as Map<String, dynamic>),
    );
    yield value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
