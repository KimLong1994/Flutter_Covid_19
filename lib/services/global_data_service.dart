import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:fluttercovid19/models/global_data.dart';

part 'global_data_service.g.dart';

@RestApi(baseUrl: "https://corona.azure-api.net/")
abstract class GlobalDataService {
  factory GlobalDataService(Dio dio, {String baseUrl}) = _GlobalDataService;

  @GET("{path}")
  Future<GlobalData> get({
    @Path("path") String path,
    @Header("X-Authorization") String token,
  });
}
