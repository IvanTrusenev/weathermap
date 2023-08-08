import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/event/base/weather_base_event.dart';
import 'package:weathermap/bloc/event/weather_request_event.dart';
import 'package:weathermap/bloc/handler/weather_request_handler.dart';
import 'package:weathermap/domain/model/weather_response.dart';

class WeatherBloc extends Bloc<WeatherBaseEvent, WeatherResponse> {
  WeatherBloc(super.initialState) {
    on<WeatherRequestEvent>(weatherRequestHandler);
  }
}
