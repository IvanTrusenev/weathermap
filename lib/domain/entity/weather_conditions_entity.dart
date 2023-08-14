import 'package:hive/hive.dart';
import 'package:weathermap/domain/entity/weather_description_entity.dart';
import 'package:weathermap/domain/model/weather_description.dart';

part 'weather_conditions_entity.g.dart';

@HiveType(typeId: 2)
class WeatherConditionsEntity {
  const WeatherConditionsEntity({
    required this.datetimeInt,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.windDegree,
    required this.weatherDesc,
  });

  const WeatherConditionsEntity.empty()
      : this(
          datetimeInt: 0,
          temp: .0,
          humidity: 0,
          windSpeed: .0,
          windDegree: 0,
          weatherDesc: const [],
        );

  @HiveField(0, defaultValue: 0)
  final int datetimeInt;

  @HiveField(1, defaultValue: .0)
  final double temp;

  @HiveField(2, defaultValue: 0)
  final int humidity;

  @HiveField(3, defaultValue: .0)
  final double windSpeed;

  @HiveField(4, defaultValue: 0)
  final int windDegree;

  @HiveField(5, defaultValue: [])
  final List<WeatherDescriptionEntity> weatherDesc;
}
