import 'package:flutter/material.dart';

import 'package:responsive_widgets/responsive_widgets.dart';

class DividerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsResponsive.symmetric(horizontal: 100),
      child: Divider(
        color: Colors.grey[350],
        thickness: 3.sp,
      ),
    );
  }
}
