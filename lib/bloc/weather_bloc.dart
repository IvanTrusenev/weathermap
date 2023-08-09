import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/event/base/weather_base_event.dart';
import 'package:weathermap/bloc/event/select_current_conditions_event.dart';
import 'package:weathermap/bloc/event/select_hourly_conditions_event.dart';
import 'package:weathermap/bloc/event/weather_request_event.dart';
import 'package:weathermap/bloc/handler/select_current_conditions_handler.dart';
import 'package:weathermap/bloc/handler/select_hourly_conditions_handler.dart';
import 'package:weathermap/bloc/handler/weather_request_handler.dart';
import 'package:weathermap/bloc/weather_state.dart';

class WeatherBloc extends Bloc<WeatherBaseEvent, WeatherState> {
  WeatherBloc(super.initialState) {
    on<WeatherRequestEvent>(weatherRequestHandler);
    on<SelectCurrentConditionsEvent>(selectCurrentConditionsHandler);
    on<SelectHourlyConditionsEvent>(selectHourlyConditionsHandler);
  }
}
