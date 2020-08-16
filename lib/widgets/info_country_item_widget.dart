import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class InfoCountryItemWidget extends StatelessWidget {
  final String title;
  final String detail;

  InfoCountryItemWidget({
    this.title,
    this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsResponsive.only(
        left: 25,
        top: 25,
        bottom: 25,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                fontSize: 50.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.sp,
                color: Colors.black54,
              ),
            ),
          ),
          Container(
            child: Text(
              detail,
              textAlign: TextAlign.center,
              style: GoogleFonts.robotoSlab(
                fontSize: 45.sp,
                fontWeight: FontWeight.w600,
                letterSpacing: 2.sp,
                color: Colors.grey[500],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
