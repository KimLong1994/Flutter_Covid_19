import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import 'package:fluttercovid19/models/country_item.dart';
import 'package:fluttercovid19/screens/country_item_screen.dart';

class ListViewWidget extends StatelessWidget {
  final List<CountryItem> list;

  ListViewWidget({@required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        final item = list[index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CountryItemScreen(item: item)),
            );
          },
          child: Container(
            height: 200.sp,
            width: double.infinity,
            margin: EdgeInsetsResponsive.only(
              left: 30,
              right: 30,
              bottom: 20,
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20.sp),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Color(0x0d000000),
                    blurRadius: 4.sp,
                    spreadRadius: 2.sp,
                  ),
                ]),
            child: Padding(
              padding: EdgeInsetsResponsive.symmetric(
                horizontal: 30,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsetsResponsive.only(right: 30),
                    height: 100.sp,
                    width: 100.sp,
                    decoration: BoxDecoration(
                      color: Color(0xFF1ec8c8),
                      borderRadius: BorderRadius.all(
                        Radius.circular(9999.sp),
                      ),
                    ),
                    child: Icon(
                      MaterialCommunityIcons.flag,
                      color: Colors.white,
                      size: 65.sp,
                    ),
                  ),
                  Container(
                    child: Text(
                      item.countryRegion,
                      style: GoogleFonts.robotoSlab(
                        color: Colors.black54,
                        fontSize: 48.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 65.sp,
                      color: Color(0xFF1ec8c8),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
