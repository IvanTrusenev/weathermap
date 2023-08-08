import 'package:json_annotation/json_annotation.dart';
import 'package:weathermap/domain/model/base/to_json.dart';

part 'weather_description.g.dart';

@JsonSerializable()
class WeatherDescription implements ToJson {
  const WeatherDescription({
    required this.main,
    required this.description,
  });

  factory WeatherDescription.fromJson(Map<String, dynamic> json) => _$WeatherDescriptionFromJson(json);

  @JsonKey(name: 'main', defaultValue: '')
  final String main;

  @JsonKey(name: 'description', defaultValue: '')
  final String description;

  @override
  Map<String, dynamic> toJson() => _$WeatherDescriptionToJson(this);
}
