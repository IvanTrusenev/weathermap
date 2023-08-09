import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/weather/event/select_current_conditions_event.dart';
import 'package:weathermap/bloc/weather/weather_state.dart';

Future<void> selectCurrentConditionsHandler(
  SelectCurrentConditionsEvent event,
  Emitter<WeatherState> emit,
) async {
  emit(WeatherState(
    response: event.response,
    selectedConditions: event.response.currentConditions,
    isCurrent: true,
  ));
}
