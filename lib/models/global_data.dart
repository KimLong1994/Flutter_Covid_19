import 'package:json_annotation/json_annotation.dart';

import 'package:fluttercovid19/models/country_item.dart';
import 'package:fluttercovid19/models/global_data_item.dart';

part 'global_data.g.dart';

@JsonSerializable()
class GlobalData {
  @JsonKey(name: "globalData")
  GlobalDataItem globalData;

  @JsonKey(name: "countries")
  List<CountryItem> countries;

   GlobalData({
    this.globalData,
    this.countries,
  });

  // @JsonKey(name: "success")
  // bool success;

  // @JsonKey(name: "data")
  // List<CountryItem> data;

  // GlobalData({
  //   this.success,
  //   this.data,
  // });

  factory GlobalData.fromJson(Map<String, dynamic> json) =>
      _$GlobalDataFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalDataToJson(this);
}
