import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathermap/bloc/event/weather_request_event.dart';
import 'package:weathermap/domain/model/weather_request.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/repository/remote/api_connector.dart';

Future<void> weatherRequestHandler(
  WeatherRequestEvent event,
  Emitter<WeatherResponse> emit,
) async {
  final ApiConnector apiConnector = ApiConnector();

  final WeatherResponse response = await apiConnector.weatherRequest(WeatherRequest(lat: event.lat, lon: event.lon));

  emit(response);
}
