// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountryItem _$CountryItemFromJson(Map<String, dynamic> json) {
  return CountryItem(
    countryRegion: json['Country_Region'] as String,
    code: json['Code'] as String,
    slug: json['Slug'] as String,
    lastUpdate: json['Last_Update'] as String,
    lat: (json['Lat'] as num)?.toDouble(),
    long: (json['Long_'] as num)?.toDouble(),
    confirmed: json['Confirmed'] as int,
    deaths: json['Deaths'] as int,
    recovered: json['Recovered'] as int,
    newConfirmed: json['NewConfirmed'] as int,
    newDeaths: json['NewDeaths'] as int,
    newRecovered: json['NewRecovered'] as int,
    active: json['Active'] as int,
    source: json['Source'] as String,
    timeLine: json['Timeline'] as String,
  );
}

Map<String, dynamic> _$CountryItemToJson(CountryItem instance) =>
    <String, dynamic>{
      'Country_Region': instance.countryRegion,
      'Code': instance.code,
      'Slug': instance.slug,
      'Last_Update': instance.lastUpdate,
      'Lat': instance.lat,
      'Long_': instance.long,
      'Confirmed': instance.confirmed,
      'Deaths': instance.deaths,
      'Recovered': instance.recovered,
      'NewConfirmed': instance.newConfirmed,
      'NewDeaths': instance.newDeaths,
      'NewRecovered': instance.newRecovered,
      'Active': instance.active,
      'Source': instance.source,
      'Timeline': instance.timeLine,
    };
