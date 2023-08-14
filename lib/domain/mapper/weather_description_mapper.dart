import 'package:weathermap/domain/entity/weather_description_entity.dart';
import 'package:weathermap/domain/model/weather_description.dart';

class WeatherDescriptionMapper {
  const WeatherDescriptionMapper._internal({
    required this.main,
    required this.description,
  });

  factory WeatherDescriptionMapper.fromModel(WeatherDescription model) {
    return WeatherDescriptionMapper._internal(
      main: model.main,
      description: model.description,
    );
  }

  factory WeatherDescriptionMapper.fromEntity(WeatherDescriptionEntity entity) {
    return WeatherDescriptionMapper._internal(
      main: entity.main,
      description: entity.description,
    );
  }

  final String main;
  final String description;

  WeatherDescription get model => WeatherDescription(
        main: main,
        description: description,
      );

  WeatherDescriptionEntity get entity => WeatherDescriptionEntity(
        main: main,
        description: description,
      );
}
