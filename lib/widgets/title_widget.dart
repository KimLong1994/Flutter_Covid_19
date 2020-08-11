import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final String time;

  TitleWidget({
    this.title,
    this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsResponsive.only(
        left: 25,
        bottom: 50,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Text(
            title,
            textAlign: TextAlign.left,
            style: GoogleFonts.robotoSlab(
              fontSize: 50.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.sp,
              color: Colors.black54,
            ),
          ),
          SizedBoxResponsive(height: 10),
          Text(
            time,
            textAlign: TextAlign.left,
            style: GoogleFonts.robotoSlab(
              fontSize: 45.sp,
              fontWeight: FontWeight.w600,
              letterSpacing: 2.sp,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}
