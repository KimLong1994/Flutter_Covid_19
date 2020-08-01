import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class GlobalItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final String statistic;

  GlobalItemWidget({
    this.icon,
    this.title,
    this.statistic,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Row(
        children: <Widget>[
          Container(
            height: 140.sp,
            width: 140.sp,
            margin: EdgeInsetsResponsive.only(
              left: 30,
              right: 45,
            ),
            decoration: BoxDecoration(
              color: Color(0xFF1ec8c8),
              borderRadius: BorderRadius.all(
                Radius.circular(9999.sp),
              ),
            ),
            child: Icon(
              icon,
              size: 85.sp,
              color: Colors.white,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsetsResponsive.only(
                  bottom: 5,
                ),
                child: Text(
                  title,
                  style: GoogleFonts.robotoSlab(
                    color: Colors.black54,
                    fontSize: 55.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                child: Text(
                  statistic,
                  style: GoogleFonts.robotoSlab(
                    color: Colors.grey[500],
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
