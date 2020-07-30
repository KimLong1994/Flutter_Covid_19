// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _GlobalDataService implements GlobalDataService {
  _GlobalDataService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'https://corona.azure-api.net/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  get({path, token}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request('$path',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{r'X-Authorization': token},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = GlobalData.fromJson(_result.data);
    return value;
  }
}
