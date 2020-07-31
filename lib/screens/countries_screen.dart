import 'package:flutter/material.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class CountriesScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ResponsiveWidgets.init(
      context,
      width: 1080,
      height: 1920,
      allowFontScaling: false,
    );

    return ResponsiveWidgets.builder(
      width: 1080,
      height: 1920,
      allowFontScaling: false,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
