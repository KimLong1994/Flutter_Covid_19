import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:fluttercovid19/models/country_data_item.dart';

class CountryItemScreen extends StatelessWidget {
  final CountryDataItem item;

  CountryItemScreen({
    this.item,
  });

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
          child: SafeArea(
            top: false,
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
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Image.network(
                        item.countryInfo.flag,
                        width: 150.sp,
                        height: 100.sp,
                      ),
                    ),
                    Image.network(
                      item.countryInfo.flag,
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
