import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'package:fluttercovid19/models/global_data.dart';
import 'package:fluttercovid19/services/global_data_service.dart';

final GetIt getIt = GetIt.instance;
final token = "e914972c-97bd-4882-a716-03aed4c1d4b1";

class GlobalDataRepository {
  final GlobalDataService _globalDataService = getIt.get<GlobalDataService>();

  Future<GlobalData> get({@required String path}) {
    print(path);
    return _globalDataService.get(
      path: path,
      token: token,
    );
  }
}
