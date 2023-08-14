import 'package:weathermap/domain/entity/weather_conditions_entity.dart';
import 'package:weathermap/domain/entity/weather_response_entity.dart';
import 'package:weathermap/domain/mapper/weather_condition_mapper.dart';
import 'package:weathermap/domain/model/weather_conditions.dart';
import 'package:weathermap/domain/model/weather_response.dart';

class WeatherResponseMapper {
  const WeatherResponseMapper._internal({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.currentConditions,
    required this.hourlyConditions,
  });

  factory WeatherResponseMapper.fromModel(WeatherResponse model) {
    final List<WeatherConditionsMapper> hourlyConditions = model.hourlyConditions
        .map(
          (e) => WeatherConditionsMapper.fromModel(e),
        )
        .toList(growable: false);

    return WeatherResponseMapper._internal(
      lat: model.lat,
      lon: model.lon,
      timezone: model.timezone,
      currentConditions: WeatherConditionsMapper.fromModel(model.currentConditions),
      hourlyConditions: hourlyConditions,
    );
  }

  factory WeatherResponseMapper.fromEntity(WeatherResponseEntity entity) {
    final List<WeatherConditionsMapper> hourlyConditions = entity.hourlyConditions
        .map(
          (e) => WeatherConditionsMapper.fromEntity(e),
        )
        .toList(growable: false);

    return WeatherResponseMapper._internal(
      lat: entity.lat,
      lon: entity.lon,
      timezone: entity.timezone,
      currentConditions: WeatherConditionsMapper.fromEntity(entity.currentConditions),
      hourlyConditions: hourlyConditions,
    );
  }

  final double lat;
  final double lon;
  final String timezone;
  final WeatherConditionsMapper currentConditions;
  final List<WeatherConditionsMapper> hourlyConditions;

  WeatherResponse get model {
    final List<WeatherConditions> locHourlyConditions = hourlyConditions.map((e) => e.model).toList(growable: false);

    return WeatherResponse(
      lat: lat,
      lon: lon,
      timezone: timezone,
      currentConditions: currentConditions.model,
      hourlyConditions: locHourlyConditions,
    );
  }

  WeatherResponseEntity get entity {
    final List<WeatherConditionsEntity> locHourlyConditions = hourlyConditions.map((e) => e.entity).toList(growable: false);

    return WeatherResponseEntity(
      lat: lat,
      lon: lon,
      timezone: timezone,
      currentConditions: currentConditions.entity,
      hourlyConditions: locHourlyConditions,
    );
  }
}
