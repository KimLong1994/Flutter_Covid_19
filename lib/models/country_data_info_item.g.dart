// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_data_info_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryDataInfoItem _$CountryDataInfoItemFromJson(Map<String, dynamic> json) {
  return CountryDataInfoItem(
    id: json['_id'] as int,
    iso2: json['iso2'] as String,
    iso3: json['iso3'] as String,
    lat: (json['lat'] as num)?.toDouble(),
    long: (json['long'] as num)?.toDouble(),
    flag: json['flag'] as String,
  );
}

Map<String, dynamic> _$CountryDataInfoItemToJson(
        CountryDataInfoItem instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'iso2': instance.iso2,
      'iso3': instance.iso3,
      'lat': instance.lat,
      'long': instance.long,
      'flag': instance.flag,
    };
