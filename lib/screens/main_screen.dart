import 'package:flutter/material.dart';

import 'package:get_it/get_it.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

import 'package:fluttercovid19/data/local_data.dart';
import 'package:fluttercovid19/widgets/app_bar_widget.dart';
import 'package:fluttercovid19/widgets/bottom_navigation_bar_widget.dart';

final GetIt getIt = GetIt.instance;

class MainScreen extends StatefulWidget {
  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var _startIndex = 0;
  final LocalData _localData = getIt.get<LocalData>();

  void _selectedIndex(int index) {
    setState(() => _startIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    print("print main");

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
      child: ContainerResponsive(
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            backgroundColor: Color(0xFFf5f6fa),
            appBar: AppBarWidget(
                title: _localData.allScreens[_startIndex]["title"]),
            body: IndexedStack(
              children: <Widget>[
                _localData.allScreens[0]["screen"],
                _localData.allScreens[1]["screen"],
                _localData.allScreens[2]["screen"],
              ],
              index: _startIndex,
            ),
            bottomNavigationBar: BottomNavigationBarWidget(
              startIndex: _startIndex,
              selectedIndex: _selectedIndex,
            ),
          ),
        ),
      ),
    );
  }
}
