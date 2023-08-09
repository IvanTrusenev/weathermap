import 'package:weathermap/domain/model/weather_conditions.dart';
import 'package:weathermap/domain/model/weather_response.dart';

class WeatherState {
  const WeatherState({
    required this.response,
    required this.selectedConditions,
    required this.isCurrent,
  });

  const WeatherState.empty()
      : this(
          response: const WeatherResponse.empty(),
          selectedConditions: const WeatherConditions.empty(),
          isCurrent: true,
        );

  final WeatherResponse response;
  final WeatherConditions selectedConditions;
  final bool isCurrent;

  WeatherState copyWith({
    WeatherResponse? response,
    WeatherConditions? selectedConditions,
    bool? isCurrent,
  }) {
    return WeatherState(
      response: response ?? this.response,
      selectedConditions: selectedConditions ?? this.selectedConditions,
      isCurrent: isCurrent ?? this.isCurrent,
    );
  }
}
