import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class GlobalItemWidget extends StatelessWidget {
  final String title;
  final String total;
  final String news;
  final double paddingBottom;

  GlobalItemWidget({
    this.title,
    this.total,
    this.news,
    this.paddingBottom,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.sp,
      width: double.infinity,
      margin: EdgeInsetsResponsive.only(
        left: 25,
        right: 25,
        bottom: paddingBottom,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20.sp),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x0d000000),
            blurRadius: 15.sp,
            spreadRadius: 15.sp,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 150.sp,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color(0xFF1ec8c8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.sp),
                topRight: Radius.circular(20.sp),
              ),
            ),
            child: Center(
              child: Text(
                title,
                style: GoogleFonts.robotoSlab(
                  color: Colors.white,
                  fontSize: 53.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 2.sp,
                ),
              ),
            ),
          ),
          Container(
            height: 250.sp,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.sp),
                bottomRight: Radius.circular(20.sp),
              ),
            ),
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsetsResponsive.only(
                          top: 30,
                          bottom: 15,
                        ),
                        child: Text(
                          "TOTAL",
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
                          total,
                          style: GoogleFonts.robotoSlab(
                            fontSize: 48.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.sp,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBoxResponsive(width: 150),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsetsResponsive.only(
                          top: 30,
                          bottom: 15,
                        ),
                        child: Text(
                          "NEW",
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
                          news,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.robotoSlab(
                            fontSize: 48.sp,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 2.sp,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBoxResponsive(width: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
