import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:device_preview/device_preview.dart';

import 'package:fluttercovid19/screens/global_screen.dart';
import 'package:fluttercovid19/screens/main_screen.dart';

import 'package:fluttercovid19/data/local_data.dart';
import 'package:fluttercovid19/services/global_data_service.dart';
import 'package:fluttercovid19/repositories/global_data_repository.dart';

final GetIt getIt = GetIt.instance;

Future setupGetIt() async {
  getIt.registerLazySingleton<GlobalDataService>(
    () => GlobalDataService(Dio()),
  );
  getIt.registerLazySingleton<GlobalDataRepository>(
    () => GlobalDataRepository(),
  );
  getIt.registerLazySingleton<GlobalScreen>(
    () => GlobalScreen(),
  );
  getIt.registerLazySingleton<LocalData>(
    () => LocalData(),
  );
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupGetIt();

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Corona 19',
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
    );
  }
}
