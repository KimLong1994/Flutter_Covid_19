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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsetsResponsive.symmetric(
              horizontal: 25,
              vertical: 50,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsetsResponsive.only(
                    bottom: 15,
                  ),
                  width: 565.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                  ),
                ),
                Container(
                  width: 565.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: <Widget>[
                for (var i = 0; i <= 3; i++)
                  Container(
                    height: 400.sp,
                    width: double.infinity,
                    margin: EdgeInsetsResponsive.only(
                      left: 25,
                      right: 25,
                      bottom: 30,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[350],
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
                  ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsetsResponsive.symmetric(
              horizontal: 25,
              vertical: 50,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsetsResponsive.only(
                    bottom: 15,
                  ),
                  width: 565.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                  ),
                ),
                Container(
                  width: 565.sp,
                  height: 50.sp,
                  decoration: BoxDecoration(
                    color: Colors.grey[350],
                    borderRadius: BorderRadius.all(Radius.circular(20.sp)),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: 15,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 200.sp,
                width: double.infinity,
                margin: EdgeInsetsResponsive.only(
                  left: 25,
                  right: 25,
                  bottom: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[350],
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
