import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'package:fluttercovid19/models/country_data_item.dart';
import 'package:fluttercovid19/models/global_data.dart';
import 'package:fluttercovid19/models/global_data_item.dart';
import 'package:fluttercovid19/repositories/countries_data_repository.dart';
import 'package:fluttercovid19/repositories/global_data_repository.dart';

import 'package:fluttercovid19/widgets/global_item_widget.dart';
import 'package:fluttercovid19/widgets/list_view_widget.dart';
import 'package:fluttercovid19/widgets/shimmer_widget.dart';
import 'package:fluttercovid19/widgets/title_widget.dart';

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
  final TextEditingController _controller = TextEditingController();
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
  List<CountryDataItem> _searchCountries;

  @override
  void initState() {
    super.initState();
    _globalDataFuture = _globalDataRepository.get(path: widget.endPointGlobal);
    _countriesDataFuture =
        _countriesDataRepository.get(path: widget.endPointCountries);
    _searchCountries = [];
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );

    ResponsiveWidgets.init(
      context,
      width: 1080,
      height: 1920,
      allowFontScaling: false,
    );

    return Theme(
      data: ThemeData(
        accentColor: Color(0xFF1ec8c8),
        primaryColor: Color(0xFF1ec8c8),
      ),
      child: ResponsiveWidgets.builder(
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
              appBar: AppBar(
                elevation: 0,
                titleSpacing: 0,
                backgroundColor: Color(0xFF1ec8c8),
                title: Container(
                  margin: EdgeInsetsResponsive.only(
                    top: 50,
                    bottom: 50,
                    left: 25,
                    right: 25,
                  ),
                  child: TextFormField(
                    controller: _controller,
                    cursorWidth: 5.sp,
                    cursorColor: Colors.black54,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF1ec8c8), width: 5.sp),
                        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.grey[300], width: 5.sp),
                        borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                      ),
                      prefixIcon: Container(
                        width: 50.sp,
                        child: Icon(
                          MaterialCommunityIcons.map_search,
                          size: 75.sp,
                          color: Colors.black54,
                        ),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.clear,
                          size: 65.sp,
                          color: Colors.black54,
                        ),
                        onPressed: () {
                          _controller.clear();
                          setState(() => _searchCountries = []);
                        },
                      ),
                      labelText: "Search Your Country",
                      labelStyle: GoogleFonts.robotoSlab(
                        fontSize: 45.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      isDense: true,
                      fillColor: Colors.white,
                      filled: true,
                    ),
                    onEditingComplete: () {
                      var keyWord = _controller.text.trim().toLowerCase();

                      if (keyWord.isNotEmpty) {
                        _countries.forEach(
                          (item) {
                            if (item.country.toLowerCase().indexOf(keyWord) !=
                                -1) {
                              var itemExist = _searchCountries.contains(item);
                              if (!itemExist) {
                                setState(() => _searchCountries.add(item));
                              }
                            }
                          },
                        );
                      }

                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    onChanged: (keyWord) {
                      if (keyWord.trim().toLowerCase().isEmpty) {
                        setState(() => _searchCountries.clear());
                      }
                    },
                  ),
                ),
              ),
              body: FutureBuilder(
                future: Future.wait([
                  _globalDataFuture,
                  _countriesDataFuture,
                ]),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (!snapshot.hasData && snapshot.data == null) {
                    return SingleChildScrollView(
                      child: ShimmerWidget(),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData &&
                      snapshot.data != null) {
                    // Take Data
                    _globalDataItem = snapshot.data[0].globalData;
                    _countries = snapshot.data[1];

                    // Format GlobalDataItem
                    final dateTime = DateTime.parse(_globalDataItem.lastUpdate);
                    final formatDate = DateFormat("dd/MM/yyyy HH:mm:ss");
                    final formatNumber = NumberFormat.simpleCurrency(
                        locale: "en_US", decimalDigits: 0, name: "Cases: ");
                    _confirmed = formatNumber.format(_globalDataItem.confirmed);
                    _deaths = formatNumber.format(_globalDataItem.deaths);
                    _recovered = formatNumber.format(_globalDataItem.recovered);
                    _active = formatNumber.format(_globalDataItem.active);
                    _newConfirmed =
                        formatNumber.format(_globalDataItem.newConfirmed);
                    _newDeaths = formatNumber.format(_globalDataItem.newDeaths);
                    _newRecovered =
                        formatNumber.format(_globalDataItem.newRecovered);
                    _timeLine = formatDate.format(dateTime);
                  }

                  return RefreshIndicator(
                    color: Color(0xFF1ec8c8),
                    strokeWidth: 7.sp,
                    onRefresh: () {
                      setState(() {
                        _globalDataFuture = _globalDataRepository.get(
                            path: widget.endPointGlobal);
                      });
                      return _globalDataFuture;
                    },
                    child: SingleChildScrollView(
                      child: _searchCountries.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBoxResponsive(height: 50),

                                // TEXT 1
                                TitleWidget(
                                  title: "AROUND THE WORLD",
                                  time: "Last Update: $_timeLine",
                                ),

                                // List View Global Item
                                Container(
                                  child: Column(
                                    children: <Widget>[
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
                                    ],
                                  ),
                                ),

                                // TEXT 2
                                TitleWidget(
                                  title: "COUNTRIES",
                                  time: "Last Update: $_timeLine",
                                ),

                                // List View Country Item
                                ListViewWidget(list: _countries),
                              ],
                            )
                          : Container(
                              margin: EdgeInsetsResponsive.only(top: 50),
                              child: ListViewWidget(list: _searchCountries)),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
