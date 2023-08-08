import 'package:json_annotation/json_annotation.dart';
import 'package:weathermap/domain/model/base/to_json.dart';
import 'package:weathermap/domain/model/weather_description.dart';

part 'weather_conditions.g.dart';

@JsonSerializable()
class WeatherConditions implements ToJson {
  const WeatherConditions({
    required this.datetimeInt,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.windDegree,
    required this.weatherDesc,
  });

  const WeatherConditions.empty()
      : this(
          datetimeInt: 0,
          temp: .0,
          humidity: 0,
          windSpeed: .0,
          windDegree: 0,
          weatherDesc: const [],
        );

  factory WeatherConditions.fromJson(Map<String, dynamic> json) => _$WeatherConditionsFromJson(json);

  @JsonKey(name: 'dt', defaultValue: 0)
  final int datetimeInt;

  @JsonKey(name: 'temp', defaultValue: .0)
  final double temp;

  @JsonKey(name: 'humidity', defaultValue: 0)
  final int humidity;

  @JsonKey(name: 'wind_speed', defaultValue: .0)
  final double windSpeed;

  @JsonKey(name: 'wind_deg', defaultValue: 0)
  final int windDegree;

  @JsonKey(name: 'weather', defaultValue: [])
  final List<WeatherDescription> weatherDesc;

  DateTime get dateTime => DateTime.fromMillisecondsSinceEpoch(datetimeInt * 1000);

  @override
  Map<String, dynamic> toJson() => _$WeatherConditionsToJson(this);
}
