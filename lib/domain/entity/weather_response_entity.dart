import 'package:hive/hive.dart';
import 'package:weathermap/domain/entity/weather_conditions_entity.dart';
import 'package:weathermap/domain/model/weather_conditions.dart';

part 'weather_response_entity.g.dart';

@HiveType(typeId: 3)
class WeatherResponseEntity {
  const WeatherResponseEntity({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.currentConditions,
    required this.hourlyConditions,
  });

  @HiveField(0, defaultValue: .0)
  final double lat;

  @HiveField(1, defaultValue: .0)
  final double lon;

  @HiveField(2, defaultValue: '')
  final String timezone;

  @HiveField(3, defaultValue: WeatherConditionsEntity.empty())
  final WeatherConditionsEntity currentConditions;

  @HiveField(4, defaultValue: [])
  final List<WeatherConditionsEntity> hourlyConditions;
}
