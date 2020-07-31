import 'package:fluttercovid19/screens/global_screen.dart';
import 'package:fluttercovid19/screens/countries_screen.dart';
import 'package:fluttercovid19/screens/information_screen.dart';

class LocalData {
  final List<Map<String, dynamic>> allScreens = [
    {
      "title": "STATISTIC ABOUT COVID-19 GLOBAL",
      "screen": GlobalScreen(),
    },
    {
      "title": "STATISTIC ABOUT COVID-19 PER COUNTRY",
      "screen": CountriesScreen(),
    },
    {
      "title": "INFORMATION ABOUT CORONA VIRUS",
      "screen": InformationScreen(),
    },
  ];
}
