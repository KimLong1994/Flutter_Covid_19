import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class ShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: Duration(seconds: 1),
      baseColor: Colors.grey[350],
      highlightColor: Color(0xFFEEEEEE),
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsetsResponsive.only(
              top: 50,
              bottom: 50,
              left: 25,
              right: 25,
            ),
            width: double.infinity,
            height: 150.sp,
            decoration: BoxDecoration(
              color: Color(0xFFBDBDBD),
              borderRadius: BorderRadius.all(Radius.circular(20.sp)),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsetsResponsive.only(
                bottom: 15,
                left: 25,
              ),
              width: 565.sp,
              height: 50.sp,
              decoration: BoxDecoration(
                color: Color(0xFFBDBDBD),
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsetsResponsive.only(
                bottom: 50,
                left: 25,
              ),
              width: 565.sp,
              height: 50.sp,
              decoration: BoxDecoration(
                color: Color(0xFFBDBDBD),
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              ),
            ),
          ),
          Container(
            height: 450.sp,
            margin: EdgeInsetsResponsive.only(
              left: 25,
              bottom: 50,
            ),
            child: ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: 850.sp,
                  height: 450.sp,
                  margin: EdgeInsetsResponsive.only(
                    right: 25,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFFBDBDBD),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x0d000000),
                        blurRadius: 4.sp,
                        spreadRadius: 2.sp,
                      ),
                    ],
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.sp),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsetsResponsive.only(
                bottom: 15,
                left: 25,
              ),
              width: 565.sp,
              height: 50.sp,
              decoration: BoxDecoration(
                color: Color(0xFFBDBDBD),
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsetsResponsive.only(
                bottom: 50,
                left: 25,
              ),
              width: 565.sp,
              height: 50.sp,
              decoration: BoxDecoration(
                color: Color(0xFFBDBDBD),
                borderRadius: BorderRadius.all(Radius.circular(20.sp)),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 185.sp,
                width: double.infinity,
                margin: EdgeInsetsResponsive.only(
                  left: 25,
                  right: 25,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFFBDBDBD),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.sp),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0d000000),
                      blurRadius: 4.sp,
                      spreadRadius: 2.sp,
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
