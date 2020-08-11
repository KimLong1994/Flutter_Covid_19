import 'package:json_annotation/json_annotation.dart';

import 'package:fluttercovid19/models/global_data_item.dart';

part 'global_data.g.dart';

@JsonSerializable()
class GlobalData {
  @JsonKey(name: "globalData")
  GlobalDataItem globalData;

  GlobalData({
    this.globalData,
  });

  factory GlobalData.fromJson(Map<String, dynamic> json) =>
      _$GlobalDataFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalDataToJson(this);
}
