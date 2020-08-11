//import 'package:flutter/material.dart';
//import 'package:flutter_vector_icons/flutter_vector_icons.dart';
//
//import 'package:get_it/get_it.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
//import 'package:google_fonts/google_fonts.dart';
//import 'package:responsive_widgets/responsive_widgets.dart';
//
//import 'package:fluttercovid19/models/country_data_item.dart';
//import 'package:fluttercovid19/models/global_data.dart';
//import 'package:fluttercovid19/repositories/global_data_repository.dart';
//import 'package:fluttercovid19/widgets/list_view_widget.dart';
//
//final getIt = GetIt.instance;
//
//class CountriesScreen extends StatefulWidget {
//  final String endPoint;
//
//  const CountriesScreen({
//    Key key,
//    this.endPoint = "/summary",
//  }) : super(key: key);
//
//  @override
//  State createState() => _CountriesScreenState();
//}
//
//class _CountriesScreenState extends State<CountriesScreen> {
//  final FocusNode _focusNode = FocusNode();
//  final TextEditingController _controller = TextEditingController();
//  final GlobalDataRepository _globalDataRepository =
//      getIt.get<GlobalDataRepository>();
//
//  bool _isEmpty;
//  Future<GlobalData> _globalDataFuture;
//  List<CountryItem> _countries;
//  List<CountryItem> _searchCountries;
//
//  @override
//  void initState() {
//    super.initState();
//    _isEmpty = true;
//    _searchCountries = [];
//    _globalDataFuture = _globalDataRepository.get(path: widget.endPoint);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    ResponsiveWidgets.init(
//      context,
//      width: 1080,
//      height: 1920,
//      allowFontScaling: false,
//    );
//
//    return ResponsiveWidgets.builder(
//      width: 1080,
//      height: 1920,
//      allowFontScaling: false,
//      child: Theme(
//        data: ThemeData(
//          primaryColor: Color(0xFF1ec8c8),
//          accentColor: Color(0xFF1ec8c8),
//        ),
//        child: FutureBuilder<GlobalData>(
//          future: _globalDataFuture,
//          builder: (BuildContext context, AsyncSnapshot<GlobalData> snapshot) {
//            print(snapshot);
//
//            print("call countries");
//            if (!snapshot.hasData && snapshot.data == null) {
//              return SpinKitFadingCircle(
//                size: 160.sp,
//                color: Color(0xFF1ec8c8),
//              );
//            }
//
//            // if (snapshot.connectionState == ConnectionState.done &&
//            //     snapshot.hasData &&
//            //     snapshot.data != null) {
//            //   _countries = snapshot.data.countries
//            //     ..sort((a, b) => a.slug.compareTo(b.slug));
//            // }
//
//            return RefreshIndicator(
//              color: Color(0xFF1ec8c8),
//              strokeWidth: 7.sp,
//              onRefresh: () {
//                setState(() {
//                  _globalDataFuture =
//                      _globalDataRepository.get(path: widget.endPoint);
//                });
//                return _globalDataFuture;
//              },
//              child: Column(
//                children: <Widget>[
//                  Container(
//                    margin: EdgeInsetsResponsive.symmetric(
//                      vertical: 40,
//                      horizontal: 30,
//                    ),
//                    child: TextFormField(
//                      controller: _controller,
//                      cursorWidth: 4.sp,
//                      cursorColor: Color(0xFF1ec8c8),
//                      decoration: InputDecoration(
//                        focusedBorder: OutlineInputBorder(
//                          borderSide:
//                              BorderSide(color: Color(0xFF1ec8c8), width: 4.sp),
//                        ),
//                        enabledBorder: OutlineInputBorder(
//                          borderSide:
//                              BorderSide(color: Color(0xFF1ec8c8), width: 4.sp),
//                        ),
//                        border: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(
//                            Radius.circular(20.sp),
//                          ),
//                        ),
//                        prefixIcon: Container(
//                          width: 50.sp,
//                          child: Icon(
//                            MaterialCommunityIcons.map_search,
//                            size: 65.sp,
//                            color: Colors.black54,
//                          ),
//                        ),
//                        suffixIcon: IconButton(
//                          icon: Icon(
//                            Icons.clear,
//                            size: 60.sp,
//                            color: Colors.black54,
//                          ),
//                          onPressed: () {
//                            _controller.clear();
//                            setState(() => _searchCountries.clear());
//                          },
//                        ),
//                        labelText: "Search Your Country",
//                        labelStyle: GoogleFonts.robotoSlab(
//                          fontSize: 40.sp,
//                          fontWeight: FontWeight.w500,
//                          color: Colors.black54,
//                        ),
//                      ),
//                      onEditingComplete: () {
//                        var keyWord = _controller.text.trim().toLowerCase();
//
//                        if (keyWord.isNotEmpty) {
//                          _countries.forEach(
//                            (item) {
//                              if (item.countryRegion
//                                      .toLowerCase()
//                                      .indexOf(keyWord) !=
//                                  -1) {
//                                var itemExist = _searchCountries.contains(item);
//                                if (!itemExist) {
//                                  setState(() => _searchCountries.add(item));
//                                }
//                              }
//                            },
//                          );
//                        }
//                      },
//                      onChanged: (keyWord) {
//                        if (keyWord.trim().toLowerCase().isEmpty) {
//                          setState(() => _searchCountries.clear());
//                        }
//                      },
//                    ),
//                  ),
//                  _searchCountries.isNotEmpty
//                      ? Expanded(child: ListViewWidget(list: _searchCountries))
//                      : Expanded(child: ListViewWidget(list: _countries)),
//                ],
//              ),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}
//
//void test() {
//  print("test function");
//}
