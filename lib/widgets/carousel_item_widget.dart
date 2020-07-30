import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CarouselItemWidget extends StatelessWidget {
  final String image;

  CarouselItemWidget({this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(50.sp),
        ),
        child: Image(
          image: AssetImage(image),
          fit: BoxFit.fitWidth,
          height: 800.sp,
        ),
      ),
    );
  }
}
