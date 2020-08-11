import 'package:json_annotation/json_annotation.dart';

part 'country_data_info_item.g.dart';

@JsonSerializable()
class CountryDataInfoItem {
  @JsonKey(name: "_id")
  int id;

  @JsonKey(name: "iso2")
  String iso2;

  @JsonKey(name: "iso3")
  String iso3;

  @JsonKey(name: "lat")
  double lat;

  @JsonKey(name: "long")
  double long;

  @JsonKey(name: "flag")
  String flag;

  CountryDataInfoItem({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryDataInfoItem.fromJson(Map<String, dynamic> json) =>
      _$CountryDataInfoItemFromJson(json);

  Map<String, dynamic> toJson() => _$CountryDataInfoItemToJson(this);
}
