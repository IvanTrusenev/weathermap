import 'package:weathermap/bloc/weather/event/base/weather_base_event.dart';

class WeatherRequestEvent extends WeatherBaseEvent {
  const WeatherRequestEvent({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;
}
