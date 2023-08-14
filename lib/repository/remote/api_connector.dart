import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:weathermap/domain/model/base/to_json.dart';
import 'package:weathermap/domain/model/weather_response.dart';
import 'package:weathermap/main.dart';

class ApiConnector {
  /// Singleton ->
  static final ApiConnector _instance = ApiConnector._internal();

  ApiConnector._internal();

  factory ApiConnector() => _instance;

  /// Singleton <-

  Future<WeatherResponse> weatherRequest(ToJson request) async {
    final Uri uri = Uri.https(config.apiAuthority, config.apiPath, request.toJson());

    final Response response = await http.get(uri);

    return WeatherResponse.fromJson(jsonDecode(response.body));
  }
}
