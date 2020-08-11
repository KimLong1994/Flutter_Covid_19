import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:fluttercovid19/models/country_data_item.dart';

part 'countries_data_service.g.dart';

@RestApi(baseUrl: "https://corona.lmao.ninja/")
abstract class CountriesDataService {
  factory CountriesDataService(Dio dio, {String baseUrl}) =
      _CountriesDataService;

  @GET("{path}")
  Future<List<CountryDataItem>> get({
    @Path("path") String path,
  });
}
