import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'package:fluttercovid19/models/country_data_item.dart';

import 'package:fluttercovid19/widgets/divider_widget.dart';
import 'package:fluttercovid19/widgets/info_country_item_widget.dart';

class CountryItemScreen extends StatelessWidget {
  final CountryDataItem item;

  CountryItemScreen({
    this.item,
  });

  final formatNumber =
      NumberFormat.simpleCurrency(locale: "en_US", decimalDigits: 0, name: "");

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
      child: Theme(
        data: ThemeData(
          primaryColor: Color(0xFF1ec8c8),
          accentColor: Color(0xFF1ec8c8),
        ),
        child: ContainerResponsive(
          color: Color(0xFFf5f6fa),
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Color(0xFF1ec8c8),
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              title: Text(
                item.country,
                textAlign: TextAlign.center,
                style: GoogleFonts.robotoSlab(
                  color: Colors.white,
                  fontSize: 58.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsetsResponsive.only(
                      top: 50,
                      bottom: 50,
                    ),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        item.countryInfo.flag,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Continent", detail: item.continent),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Cases", detail: formatNumber.format(item.cases)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Today Cases:",
                      detail: formatNumber.format(item.todayCases)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Deaths:",
                      detail: formatNumber.format(item.deaths)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Today Deaths",
                      detail: formatNumber.format(item.todayDeaths)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Recovered:",
                      detail: formatNumber.format(item.recovered)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Today Recovered:",
                      detail: formatNumber.format(item.todayRecovered)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Active",
                      detail: formatNumber.format(item.active)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Critical",
                      detail: formatNumber.format(item.critical)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Cases Per One Million",
                      detail: formatNumber.format(item.casesPerOneMillion)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Deaths Per One Million:",
                      detail: formatNumber.format(item.deathsPerOneMillion)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Tests:", detail: formatNumber.format(item.tests)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Tests Per One Million:",
                      detail: formatNumber.format(item.testsPerOneMillion)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "One Case Per People:",
                      detail: formatNumber.format(item.oneCasePerPeople)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "One Death Per People:",
                      detail: formatNumber.format(item.oneDeathPerPeople)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "One Test Per People:",
                      detail: formatNumber.format(item.testsPerOneMillion)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Active Per One Million:",
                      detail: formatNumber.format(item.activePerOneMillion)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Recovered Per One Million:",
                      detail: formatNumber.format(item.recoveredPerOneMillion)),
                  DividerWidget(),
                  InfoCountryItemWidget(
                      title: "Critical Per One Million:",
                      detail: formatNumber.format(item.criticalPerOneMillion)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
