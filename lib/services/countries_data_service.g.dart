// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_data_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CountriesDataService implements CountriesDataService {
  _CountriesDataService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://corona.lmao.ninja/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  get({path}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<List<dynamic>> _result = await _dio.request('$path',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    var value = _result.data
        .map((dynamic i) => CountryDataItem.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }
}
