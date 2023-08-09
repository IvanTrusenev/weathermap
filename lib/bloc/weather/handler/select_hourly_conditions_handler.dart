import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/weather/event/select_hourly_conditions_event.dart';
import 'package:weathermap/bloc/weather/weather_state.dart';

Future<void> selectHourlyConditionsHandler(
  SelectHourlyConditionsEvent event,
  Emitter<WeatherState> emit,
) async {
  emit(WeatherState(
    response: event.response,
    selectedConditions: event.selectedConditions,
    isCurrent: false,
  ));
}
