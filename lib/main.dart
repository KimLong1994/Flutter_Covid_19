import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dio/dio.dart';
import 'package:fluttercovid19/data/local_data.dart';
import 'package:fluttercovid19/screens/global_screen.dart';
import 'package:get_it/get_it.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:fluttercovid19/widgets/list_view_01_widget.dart';
import 'package:fluttercovid19/widgets/app_bar_widget.dart';
import 'package:fluttercovid19/widgets/bottom_navigation_bar_widget.dart';

import 'package:fluttercovid19/models/country_item.dart';
import 'package:fluttercovid19/models/global_data.dart';
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
}

void main() async {
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // final String endPoint;

  // const MyHomePage({
  //   Key key,
  //   this.endPoint = "/summary",
  // }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _startIndex = 0;
  // final GlobalDataRepository _globalDataRepository =
  //     getIt.get<GlobalDataRepository>();

  // Future<GlobalData> _globalDataFuture;
  // GlobalData _globalData;
  // List<CountryItem> _countryItemList;

  void _selectedIndex(int index) {
    setState(() => _startIndex = index);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _globalDataFuture = _globalDataRepository.get(path: widget.endPoint);
  // }

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      width: 1080,
      height: 1920,
      allowFontScaling: false,
    );

    return ResponsiveWidgets.builder(
      width: 1080,
      height: 1920,
      allowFontScaling: false,
      child: ContainerResponsive(
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Color(0xFFf5f6fa),
            appBar: AppBarWidget(title: LocalData.allScreens[_startIndex]["title"]),
            body: LocalData.allScreens[_startIndex]["screen"],
            bottomNavigationBar: BottomNavigationBarWidget(
              startIndex: _startIndex,
              selectedIndex: _selectedIndex,
            ),
          ),
        ),
      ),
    );
  }
}
