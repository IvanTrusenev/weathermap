import 'package:weathermap/domain/model/base/to_json.dart';
import 'package:weathermap/main.dart';

class WeatherRequest implements ToJson {
  const WeatherRequest({
    required this.lat,
    required this.lon,
  });

  final double lat;
  final double lon;

  String get _units => 'metric';

  String get _lang => 'ru';

  @override
  Map<String, dynamic> toJson() => {
        'appid': config.apiKey,
        'lat': lat.toString(),
        'lon': lon.toString(),
        'units': _units,
        'lang': _lang,
      };
}
