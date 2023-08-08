import 'package:weathermap/domain/model/base/to_json.dart';
import 'package:weathermap/domain/model/weather_conditions.dart';

class WeatherResponse implements ToJson {
  const WeatherResponse({
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.currentConditions,
    required this.hourlyConditions,
  });

  const WeatherResponse.empty()
      : this(
          lat: .0,
          lon: .0,
          timezone: '',
          currentConditions: const WeatherConditions.empty(),
          hourlyConditions: const [],
        );

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> rawCurrentConditions = (json['current'] as Map<String, dynamic>?) ?? {};
    final WeatherConditions currentConditions = WeatherConditions.fromJson(rawCurrentConditions);

    final List<dynamic> rawHourlyConditions = (json['hourly'] as List<dynamic>?) ?? [];
    final List<WeatherConditions> hourlyConditions = rawHourlyConditions
        .map(
          (e) => WeatherConditions.fromJson(e as Map<String, dynamic>),
        )
        .toList(growable: false);

    return WeatherResponse(
      lat: (json['lat'] as num?)?.toDouble() ?? 0.0,
      lon: (json['lon'] as num?)?.toDouble() ?? 0.0,
      timezone: json['timezone'] as String? ?? '',
      currentConditions: currentConditions,
      hourlyConditions: hourlyConditions,
    );
  }

  final double lat;
  final double lon;
  final String timezone;
  final WeatherConditions currentConditions;
  final List<WeatherConditions> hourlyConditions;

  @override
  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lon': lon,
        'timezone': timezone,
        'current': currentConditions,
        'hourly': hourlyConditions,
      };
}
