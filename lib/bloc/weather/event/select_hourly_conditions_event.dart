import 'package:weathermap/bloc/weather/event/base/weather_base_event.dart';
import 'package:weathermap/domain/model/weather_conditions.dart';
import 'package:weathermap/domain/model/weather_response.dart';

class SelectHourlyConditionsEvent extends WeatherBaseEvent {
  const SelectHourlyConditionsEvent({
    required this.response,
    required this.selectedConditions,
  });

  final WeatherResponse response;
  final WeatherConditions selectedConditions;
}
