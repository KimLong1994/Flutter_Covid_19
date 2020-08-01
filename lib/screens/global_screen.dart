import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'package:fluttercovid19/widgets/carousel_widget.dart';
import 'package:fluttercovid19/widgets/global_item_widget.dart';

import 'package:fluttercovid19/models/global_data.dart';
import 'package:fluttercovid19/models/global_data_item.dart';
import 'package:fluttercovid19/repositories/global_data_repository.dart';

final GetIt getIt = GetIt.instance;

class GlobalScreen extends StatefulWidget {
  final String endPoint;

  const GlobalScreen({
    Key key,
    this.endPoint = "/summary",
  }) : super(key: key);

  @override
  State createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  final GlobalDataRepository _globalDataRepository =
      getIt.get<GlobalDataRepository>();

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
            _globalDataItem = snapshot.data.globalData;

            // Format GlobalDataItem
            var dateTime = DateTime.parse(_globalDataItem.lastUpdate);
            var formatDate = DateFormat("dd/MM/yyyy HH:mm:ss");
            var formatNumber = NumberFormat.simpleCurrency(
                locale: "en_US", decimalDigits: 0, name: "Cases: ");
            _confirmed = formatNumber.format(_globalDataItem.confirmed);
            _deaths = formatNumber.format(_globalDataItem.deaths);
            _recovered = formatNumber.format(_globalDataItem.recovered);
            _active = formatNumber.format(_globalDataItem.active);
            _newConfirmed = formatNumber.format(_globalDataItem.newConfirmed);
            _newDeaths = formatNumber.format(_globalDataItem.newDeaths);
            _newRecovered = formatNumber.format(_globalDataItem.newRecovered);
            _timeLine = formatDate.format(dateTime);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        height: 550.sp,
                        decoration: BoxDecoration(
                          color: Color(0xFF1ec8c8),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x0d000000),
                              blurRadius: 4.sp,
                              spreadRadius: 2.sp,
                            ),
                          ],
                        ),
                      ),
                      CarouselWidget(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsetsResponsive.only(
                        top: 45, bottom: 5, left: 30, right: 30),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Total Global Data",
                          style: GoogleFonts.robotoSlab(
                            color: Colors.black54,
                            fontSize: 63.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Receive GlobalDataItem From Internet
                  Container(
                    margin: EdgeInsetsResponsive.only(
                        bottom: 45, left: 30, right: 30),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Last Update Time: $_timeLine",
                          style: GoogleFonts.robotoSlab(
                            color: Colors.grey[500],
                            fontSize: 55.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GlobalItemWidget(
                    title: "Confirmed",
                    statistic: _confirmed,
                    icon: MaterialCommunityIcons.account_badge_alert,
                  ),
                  GlobalItemWidget(
                    title: "Deaths",
                    statistic: _deaths,
                    icon: MaterialCommunityIcons.alert_decagram,
                  ),
                  GlobalItemWidget(
                    title: "Recovered",
                    statistic: _recovered,
                    icon: MaterialCommunityIcons.heart,
                  ),
                  GlobalItemWidget(
                    title: "Active",
                    statistic: _active,
                    icon: MaterialCommunityIcons.blood_bag,
                  ),
                  GlobalItemWidget(
                    title: "New Confirmed",
                    statistic: _newConfirmed,
                    icon: MaterialCommunityIcons.new_box,
                  ),
                  GlobalItemWidget(
                    title: "New Deaths",
                    statistic: _newDeaths,
                    icon: MaterialCommunityIcons.emoticon_sad,
                  ),
                  GlobalItemWidget(
                    title: "New Recovered",
                    statistic: _newRecovered,
                    icon: MaterialCommunityIcons.emoticon_happy,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
