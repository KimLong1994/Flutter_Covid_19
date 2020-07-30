// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalData _$GlobalDataFromJson(Map<String, dynamic> json) {
  return GlobalData(
    globalData: json['globalData'] == null
        ? null
        : GlobalDataItem.fromJson(json['globalData'] as Map<String, dynamic>),
    countries: (json['countries'] as List)
        ?.map((e) =>
            e == null ? null : CountryItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GlobalDataToJson(GlobalData instance) =>
    <String, dynamic>{
      'globalData': instance.globalData,
      'countries': instance.countries,
    };
