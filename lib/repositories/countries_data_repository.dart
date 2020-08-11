import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:fluttercovid19/models/country_data_item.dart';
import 'package:fluttercovid19/services/countries_data_service.dart';

final GetIt getIt = GetIt.instance;

class CountriesDataRepository {
  final CountriesDataService _countriesDataService =
      getIt.get<CountriesDataService>();

  Future<List<CountryDataItem>> get({@required String path}) {
    return _countriesDataService.get(path: path);
  }
}
