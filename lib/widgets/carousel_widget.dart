import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:fluttercovid19/widgets/carousel_item_widget.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CarouselWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 800.sp,
      child: Carousel(
        dotBgColor: Colors.transparent,
        dotIncreasedColor: Color(0xFF1fc2c3),
        dotColor: Color(0xFFe1e1e3),
        dotIncreaseSize: 1.1,
        dotSize: 30.sp,
        dotSpacing: 50.sp,
        dotVerticalPadding: -40.sp,
        dotPosition: DotPosition.bottomCenter,
        animationCurve: Curves.easeInOutCirc,
        autoplayDuration: Duration(seconds: 5),
        images: [
          CarouselItemWidget(
              image: "assets/images/thank_you_stay_home_stay_safe.jpg"),
          CarouselItemWidget(
              image: "assets/images/family_stay_home_stay_safe.jpg"),
          CarouselItemWidget(
              image: "assets/images/doctor_stay_home_stay_safe.jpg"),
          CarouselItemWidget(
              image: "assets/images/poster_stay_home_stay_safe.jpg"),
          // CarouselItemWidget(
          // image: "assets/images/wash_hand_stay_home_stay_safe.jpg"),
        ],
      ),
    );
  }
}
