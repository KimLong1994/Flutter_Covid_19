import 'package:json_annotation/json_annotation.dart';
import 'package:fluttercovid19/models/country_data_info_item.dart';

part 'country_data_item.g.dart';

@JsonSerializable()
class CountryDataItem {
  @JsonKey(name: "updated")
  int updated;

  @JsonKey(name: "country")
  String country;

  @JsonKey(name: "countryInfo")
  CountryDataInfoItem countryInfo;

  @JsonKey(name: "cases")
  int cases;

  @JsonKey(name: "todayCases")
  int todayCases;

  @JsonKey(name: "deaths")
  int deaths;

  @JsonKey(name: "todayDeaths")
  int todayDeaths;

  @JsonKey(name: "recovered")
  int recovered;

  @JsonKey(name: "todayRecovered")
  int todayRecovered;

  @JsonKey(name: "active")
  int active;

  @JsonKey(name: "critical")
  int critical;

  @JsonKey(name: "casesPerOneMillion")
  int casesPerOneMillion;

  @JsonKey(name: "deathsPerOneMillion")
  double deathsPerOneMillion;

  @JsonKey(name: "tests")
  int tests;

  @JsonKey(name: "testsPerOneMillion")
  int testsPerOneMillion;

  @JsonKey(name: "population")
  int population;

  @JsonKey(name: "continent")
  String continent;

  @JsonKey(name: "oneCasePerPeople")
  int oneCasePerPeople;

  @JsonKey(name: "oneDeathPerPeople")
  int oneDeathPerPeople;

  @JsonKey(name: "oneTestPerPeople")
  int oneTestPerPeople;

  @JsonKey(name: "activePerOneMillion")
  double activePerOneMillion;

  @JsonKey(name: "recoveredPerOneMillion")
  double recoveredPerOneMillion;

  @JsonKey(name: "criticalPerOneMillion")
  double criticalPerOneMillion;

  CountryDataItem({
    this.updated,
    this.country,
    this.countryInfo,
    this.cases,
    this.todayCases,
    this.deaths,
    this.todayDeaths,
    this.recovered,
    this.todayRecovered,
    this.active,
    this.critical,
    this.casesPerOneMillion,
    this.deathsPerOneMillion,
    this.tests,
    this.testsPerOneMillion,
    this.population,
    this.continent,
    this.oneCasePerPeople,
    this.oneDeathPerPeople,
    this.oneTestPerPeople,
    this.activePerOneMillion,
    this.recoveredPerOneMillion,
    this.criticalPerOneMillion,
  });

  factory CountryDataItem.fromJson(Map<String, dynamic> json) =>
      _$CountryDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataItemToJson(this);
}
