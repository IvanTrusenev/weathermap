import 'package:weathermap/domain/entity/weather_conditions_entity.dart';
import 'package:weathermap/domain/entity/weather_description_entity.dart';
import 'package:weathermap/domain/mapper/weather_description_mapper.dart';
import 'package:weathermap/domain/model/weather_conditions.dart';
import 'package:weathermap/domain/model/weather_description.dart';

class WeatherConditionsMapper {
  const WeatherConditionsMapper._internal({
    required this.datetimeInt,
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.windDegree,
    required this.weatherDesc,
  });

  factory WeatherConditionsMapper.fromModel(WeatherConditions model) {
    final List<WeatherDescriptionMapper> weatherDesc = model.weatherDesc.map((e) => WeatherDescriptionMapper.fromModel(e)).toList(growable: false);

    return WeatherConditionsMapper._internal(
      datetimeInt: model.datetimeInt,
      temp: model.temp,
      humidity: model.humidity,
      windSpeed: model.windSpeed,
      windDegree: model.windDegree,
      weatherDesc: weatherDesc,
    );
  }

  factory WeatherConditionsMapper.fromEntity(WeatherConditionsEntity entity) {
    final List<WeatherDescriptionMapper> weatherDesc = entity.weatherDesc.map((e) => WeatherDescriptionMapper.fromEntity(e)).toList(growable: false);

    return WeatherConditionsMapper._internal(
      datetimeInt: entity.datetimeInt,
      temp: entity.temp,
      humidity: entity.humidity,
      windSpeed: entity.windSpeed,
      windDegree: entity.windDegree,
      weatherDesc: weatherDesc,
    );
  }

  final int datetimeInt;
  final double temp;
  final int humidity;
  final double windSpeed;
  final int windDegree;
  final List<WeatherDescriptionMapper> weatherDesc;

  WeatherConditions get model {
    final List<WeatherDescription> locWeatherDesc = weatherDesc.map((e) => e.model).toList(growable: false);

    return WeatherConditions(
      datetimeInt: datetimeInt,
      temp: temp,
      humidity: humidity,
      windSpeed: windSpeed,
      windDegree: windDegree,
      weatherDesc: locWeatherDesc,
    );
  }

  WeatherConditionsEntity get entity {
    final List<WeatherDescriptionEntity> locWeatherDesc = weatherDesc.map((e) => e.entity).toList(growable: false);

    return WeatherConditionsEntity(
      datetimeInt: datetimeInt,
      temp: temp,
      humidity: humidity,
      windSpeed: windSpeed,
      windDegree: windDegree,
      weatherDesc: locWeatherDesc,
    );
  }
}
