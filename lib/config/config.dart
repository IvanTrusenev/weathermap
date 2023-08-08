class Config {
  /// Singleton ->
  static final Config _instance = Config._internal();

  Config._internal();

  factory Config() => _instance;

  /// Singleton <-

  /// Api ->
  // String get apiRoot => 'https://api.openweathermap.org/data/3.0/onecall?appid=$_apiKey';

  String get apiAuthority => 'api.openweathermap.org';

  String get apiPath => 'data/3.0/onecall';

  String get apiKey => 'e04a3bf47c9469a2e72b98e7f616f536';

  /// API <-
}
