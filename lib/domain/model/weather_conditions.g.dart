// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_conditions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherConditions _$WeatherConditionsFromJson(Map<String, dynamic> json) =>
    WeatherConditions(
      datetimeInt: json['dt'] as int? ?? 0,
      temp: (json['temp'] as num?)?.toDouble() ?? 0.0,
      humidity: json['humidity'] as int? ?? 0,
      windSpeed: (json['wind_speed'] as num?)?.toDouble() ?? 0.0,
      windDegree: json['wind_deg'] as int? ?? 0,
      weatherDesc: (json['weather'] as List<dynamic>?)
              ?.map(
                  (e) => WeatherDescription.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$WeatherConditionsToJson(WeatherConditions instance) =>
    <String, dynamic>{
      'dt': instance.datetimeInt,
      'temp': instance.temp,
      'humidity': instance.humidity,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDegree,
      'weather': instance.weatherDesc,
    };
