import 'package:weathermap/bloc/event/base/weather_base_event.dart';
import 'package:weathermap/domain/model/weather_response.dart';

class SelectCurrentConditionsEvent extends WeatherBaseEvent {
  const SelectCurrentConditionsEvent({
    required this.response,
  });

  final WeatherResponse response;
}
