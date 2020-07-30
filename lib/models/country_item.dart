import 'package:json_annotation/json_annotation.dart';

part 'country_item.g.dart';

@JsonSerializable()
class CountryItem {
  @JsonKey(name: "Country_Region")
  String countryRegion;

  @JsonKey(name: "Code")
  String code;

  @JsonKey(name: "Slug")
  String slug;

  @JsonKey(name: "Last_Update")
  String lastUpdate;

  @JsonKey(name: "Lat")
  double lat;

  @JsonKey(name: "Long_")
  double long;

  @JsonKey(name: "Confirmed")
  int confirmed;

  @JsonKey(name: "Deaths")
  int deaths;

  @JsonKey(name: "Recovered")
  int recovered;

  @JsonKey(name: "NewConfirmed")
  int newConfirmed;

  @JsonKey(name: "NewDeaths")
  int newDeaths;

  @JsonKey(name: "NewRecovered")
  int newRecovered;

  @JsonKey(name: "Active")
  int active;

  @JsonKey(name: "Source")
  String source;

  @JsonKey(name: "Timeline")
  String timeLine;

  CountryItem({
    this.countryRegion,
    this.code,
    this.slug,
    this.lastUpdate,
    this.lat,
    this.long,
    this.confirmed,
    this.deaths,
    this.recovered,
    this.newConfirmed,
    this.newDeaths,
    this.newRecovered,
    this.active,
    this.source,
    this.timeLine,
  });

  // @JsonKey(name: "regionName")
  // String regionName;

  // @JsonKey(name: "casesCount")
  // int casesCount;

  // @JsonKey(name: "recoveredCount")
  // int recoveredCount;

  // @JsonKey(name: "deceasedCount")
  // int deceasedCount;

  // @JsonKey(name: "regionFlagUrl")
  // String regionFlagUrl;

  // CountryItem({
  //   this.regionName,
  //   this.casesCount,
  //   this.recoveredCount,
  //   this.deceasedCount,
  //   this.regionFlagUrl,
  // });

  factory CountryItem.fromJson(Map<String, dynamic> json) =>
      _$CountryItemFromJson(json);

  Map<String, dynamic> toJson() => _$CountryItemToJson(this);
}
