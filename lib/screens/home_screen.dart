import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:fluttercovid19/models/country_data_item.dart';
import 'package:fluttercovid19/models/global_data.dart';
import 'package:fluttercovid19/models/global_data_item.dart';
import 'package:fluttercovid19/repositories/countries_data_repository.dart';
import 'package:fluttercovid19/repositories/global_data_repository.dart';
import 'package:fluttercovid19/widgets/country_item_widget.dart';
import 'package:fluttercovid19/widgets/global_item_widget.dart';
import 'package:fluttercovid19/widgets/list_view_widget.dart';
import 'package:fluttercovid19/widgets/search_widget.dart';
import 'package:fluttercovid19/widgets/shimmer_widget.dart';
import 'package:fluttercovid19/widgets/title_widget.dart';

import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'package:fluttercovid19/widgets/app_bar_widget.dart';
import 'package:shimmer/shimmer.dart';

final GetIt getIt = GetIt.instance;

class HomeScreen extends StatefulWidget {
  final String endPointGlobal;
  final String endPointCountries;

  const HomeScreen({
    Key key,
    this.endPointGlobal = "/summary",
    this.endPointCountries = "/v2/countries?yesterday&sort",
  }) : super(key: key);

  @override
  State createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalDataRepository _globalDataRepository =
      getIt.get<GlobalDataRepository>();
  final CountriesDataRepository _countriesDataRepository =
      getIt.get<CountriesDataRepository>();

  String _confirmed;
  String _deaths;
  String _recovered;
  String _active;
  String _newConfirmed;
  String _newDeaths;
  String _newRecovered;
  String _timeLine;
  Future<GlobalData> _globalDataFuture;
  GlobalDataItem _globalDataItem;

  Future<List<CountryDataItem>> _countriesDataFuture;
  List<CountryDataItem> _countries;

  bool _render;

  @override
  void initState() {
    super.initState();
    _globalDataFuture = _globalDataRepository.get(path: widget.endPointGlobal);
    _countriesDataFuture =
        _countriesDataRepository.get(path: widget.endPointCountries);
//    _render = false;
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
      child: ContainerResponsive(
        color: Color(0xFFf5f6fa),
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Color(0xFFf5f6fa),
            appBar: AppBarWidget(),
            body: RefreshIndicator(
              onRefresh: () {
                setState(() {
                  _globalDataFuture =
                      _globalDataRepository.get(path: widget.endPointGlobal);
//                  _countriesDataFuture =
//                      _countriesDataRepository.get(path: widget.endPointCountries);
                });
                return _globalDataFuture;
              },
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    // Future Builder World
                    FutureBuilder<GlobalData>(
                      future: _globalDataFuture,
                      builder: (BuildContext context,
                          AsyncSnapshot<GlobalData> snapshot) {
                        print(snapshot);

                        if (!snapshot.hasData && snapshot.data == null) {
                          return ShimmerWidget();
                        }

                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData &&
                            snapshot.data != null) {
                          _globalDataItem = snapshot.data.globalData;

                          // Format GlobalDataItem
                          var dateTime =
                              DateTime.parse(_globalDataItem.lastUpdate);
                          var formatDate = DateFormat("dd/MM/yyyy HH:mm:ss");
                          var formatNumber = NumberFormat.simpleCurrency(
                              locale: "en_US",
                              decimalDigits: 0,
                              name: "Cases: ");
                          _confirmed =
                              formatNumber.format(_globalDataItem.confirmed);
                          _deaths = formatNumber.format(_globalDataItem.deaths);
                          _recovered =
                              formatNumber.format(_globalDataItem.recovered);
                          _active = formatNumber.format(_globalDataItem.active);
                          _newConfirmed =
                              formatNumber.format(_globalDataItem.newConfirmed);
                          _newDeaths =
                              formatNumber.format(_globalDataItem.newDeaths);
                          _newRecovered =
                              formatNumber.format(_globalDataItem.newRecovered);
                          _timeLine = formatDate.format(dateTime);
                        }

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            // SEARCH
                            SearchWidget(),

                            // TEXT 1
                            TitleWidget(
                              title: "AROUND THE WORLD",
                              time: "Last Update: $_timeLine",
                            ),

                            // LIST VIEW 1
                            GlobalItemWidget(
                              title: "CONFIRMED",
                              total: _confirmed,
                              news: _newConfirmed,
                              paddingBottom: 30,
                            ),
                            GlobalItemWidget(
                              title: "DEATHS",
                              total: _deaths,
                              news: _newDeaths,
                              paddingBottom: 30,
                            ),
                            GlobalItemWidget(
                              title: "RECOVERED",
                              total: _recovered,
                              news: _newRecovered,
                              paddingBottom: 30,
                            ),
                            GlobalItemWidget(
                              title: "ACTIVE",
                              total: _active,
                              news: _newConfirmed,
                              paddingBottom: 50,
                            ),

                            // TEXT 2
                            TitleWidget(
                              title: "COUNTRIES",
                              time: "Last Update: $_timeLine",
                            ),
                          ],
                        );
                      },
                    ),

                    // Future Builder Countries
                    FutureBuilder<List<CountryDataItem>>(
                      future: _countriesDataFuture,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<CountryDataItem>> snapshot) {
                        // print(snapshot);

                        if (!snapshot.hasData && snapshot.data == null) {
                          return ShimmerWidget();
                        }

                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData &&
                            snapshot.data != null) {
                          _countries = snapshot.data;
                        }

                        return ListViewWidget(list: _countries);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
