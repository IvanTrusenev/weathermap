import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/weather/event/base/weather_base_event.dart';
import 'package:weathermap/bloc/weather/event/select_current_conditions_event.dart';
import 'package:weathermap/bloc/weather/event/select_hourly_conditions_event.dart';
import 'package:weathermap/bloc/weather/event/weather_request_event.dart';
import 'package:weathermap/bloc/weather/handler/select_current_conditions_handler.dart';
import 'package:weathermap/bloc/weather/handler/select_hourly_conditions_handler.dart';
import 'package:weathermap/bloc/weather/handler/weather_request_handler.dart';
import 'package:weathermap/bloc/weather/weather_state.dart';

class WeatherBloc extends Bloc<WeatherBaseEvent, WeatherState> {
  WeatherBloc(super.initialState) {
    on<WeatherRequestEvent>(weatherRequestHandler);
    on<SelectCurrentConditionsEvent>(selectCurrentConditionsHandler);
    on<SelectHourlyConditionsEvent>(selectHourlyConditionsHandler);
  }
}
