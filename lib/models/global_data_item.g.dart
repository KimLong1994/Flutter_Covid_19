// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalDataItem _$GlobalDataItemFromJson(Map<String, dynamic> json) {
  return GlobalDataItem(
    confirmed: json['Confirmed'] as int,
    deaths: json['Deaths'] as int,
    recovered: json['Recovered'] as int,
    newConfirmed: json['NewConfirmed'] as int,
    newDeaths: json['NewDeaths'] as int,
    newRecovered: json['NewRecovered'] as int,
    lastUpdate: json['Last_Update'] as String,
  )..active = json['Active'] as int;
}

Map<String, dynamic> _$GlobalDataItemToJson(GlobalDataItem instance) =>
    <String, dynamic>{
      'Confirmed': instance.confirmed,
      'Deaths': instance.deaths,
      'Recovered': instance.recovered,
      'Active': instance.active,
      'NewConfirmed': instance.newConfirmed,
      'NewDeaths': instance.newDeaths,
      'NewRecovered': instance.newRecovered,
      'Last_Update': instance.lastUpdate,
    };
