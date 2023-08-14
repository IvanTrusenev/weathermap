import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Config {
  /// Singleton ->
  static final Config _instance = Config._internal();

  Config._internal();

  factory Config() => _instance;

  /// Singleton <-

  /// Api ->
  String get apiAuthority => 'api.openweathermap.org';

  String get apiPath => 'data/3.0/onecall';

  String get apiKey => 'e04a3bf47c9469a2e72b98e7f616f536';

  /// API <-

  String get documentsDirectory => _documentsDirectory;
  String _documentsDirectory = '';

  Future<void> init() async {
    final Directory documentsDirectory = await getApplicationDocumentsDirectory();
    _documentsDirectory = documentsDirectory.path;
  }
}
