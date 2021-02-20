import 'package:thinkific/models/user_location.dart';
import 'package:thinkific/models/weather_main_part.dart';

class WeatherInfo {
  UserLocation location;

  final WeatherMainPart main;
  final String name;

  WeatherInfo(this.main, this.name);

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return WeatherInfo(null, null);
    }

    return WeatherInfo(
      WeatherMainPart.fromJson(json['main'] as Map<String, dynamic>),
      json['name'] as String,
    );
  }
}
