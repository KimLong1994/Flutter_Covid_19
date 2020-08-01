import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttercovid19/models/country_item.dart';
import 'package:fluttercovid19/models/global_data.dart';
import 'package:fluttercovid19/repositories/global_data_repository.dart';
import 'package:fluttercovid19/widgets/list_view_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

final getIt = GetIt.instance;

class CountriesScreen extends StatefulWidget {
  final String endPoint;

  const CountriesScreen({
    Key key,
    this.endPoint = "/summary",
  }) : super(key: key);

  @override
  State createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  final GlobalDataRepository _globalDataRepository =
      getIt.get<GlobalDataRepository>();

  Future<GlobalData> _globalDataFuture;
  List<CountryItem> _countries;

  @override
  void initState() {
    super.initState();
    _globalDataFuture = _globalDataRepository.get(path: widget.endPoint);
  }

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
      child: FutureBuilder<GlobalData>(
        future: _globalDataFuture,
        builder: (BuildContext context, AsyncSnapshot<GlobalData> snapshot) {
          print(snapshot);

          if (!snapshot.hasData && snapshot.data == null) {
            return SpinKitFadingCircle(
              size: 160.sp,
              color: Color(0xFF1ec8c8),
            );
          }

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              snapshot.data != null) {
            print(snapshot.data.countries);
            _countries = snapshot.data.countries;
          }

          return RefreshIndicator(
            color: Color(0xFF1ec8c8),
            strokeWidth: 7.sp,
            onRefresh: () {
              setState(() {
                _globalDataFuture =
                    _globalDataRepository.get(path: widget.endPoint);
              });
              return _globalDataFuture;
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ListViewWidget(list: _countries),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
