import 'package:json_annotation/json_annotation.dart';

part 'global_data_item.g.dart';

@JsonSerializable()
class GlobalDataItem {
  @JsonKey(name: "Confirmed")
  int confirmed;

  @JsonKey(name: "Deaths")
  int deaths;

  @JsonKey(name: "Recovered")
  int recovered;

  @JsonKey(name: "Active")
  int active;

  @JsonKey(name: "NewConfirmed")
  int newConfirmed;

  @JsonKey(name: "NewDeaths")
  int newDeaths;

  @JsonKey(name: "NewRecovered")
  int newRecovered;

  @JsonKey(name: "Last_Update")
  String lastUpdate;

  GlobalDataItem({
    this.confirmed,
    this.deaths,
    this.recovered,
    this.newConfirmed,
    this.newDeaths,
    this.newRecovered,
    this.lastUpdate,
  });

  factory GlobalDataItem.fromJson(Map<String, dynamic> json) =>
      _$GlobalDataItemFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalDataItemToJson(this);
}
