import 'package:hive/hive.dart';
import 'package:weathermap/config/config.dart';
import 'package:weathermap/domain/entity/weather_conditions_entity.dart';
import 'package:weathermap/domain/entity/weather_description_entity.dart';
import 'package:weathermap/domain/entity/weather_response_entity.dart';

class Database {
  /// Singleton ->
  static final Database _instance = Database._internal();

  Database._internal();

  factory Database() => _instance;

  /// Singleton <-

  String get _databasePath => Config().documentsDirectory;

  String get _weatherBoxName => 'weather';

  String get _weatherUniqueKey => 'weather';

  late final Box<WeatherResponseEntity> _weatherBox;

  Future<void> init() async {
    print(_databasePath);

    Hive
      ..init(_databasePath)
      ..registerAdapter(WeatherDescriptionEntityAdapter())
      ..registerAdapter(WeatherConditionsEntityAdapter())
      ..registerAdapter(WeatherResponseEntityAdapter());

    _weatherBox = await Hive.openBox(_weatherBoxName);
  }

  Future<WeatherResponseEntity?> readWeather() async {
    return _weatherBox.get(_weatherUniqueKey);
  }

  Future<void> writeWeather(WeatherResponseEntity record) async {
    _weatherBox.put(_weatherUniqueKey, record);
  }
}
