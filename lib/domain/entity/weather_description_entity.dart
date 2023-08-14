import 'package:hive/hive.dart';

part 'weather_description_entity.g.dart';

@HiveType(typeId: 4)
class WeatherDescriptionEntity {
  const WeatherDescriptionEntity({
    required this.main,
    required this.description,
  });

  @HiveField(0, defaultValue: '')
  final String main;

  @HiveField(1, defaultValue: '')
  final String description;
}
