class WeatherMainPart {
  num temp;
  num feelsLike;
  num tempMin;
  num tempMax;
  num pressure;
  num humidity;
  num seaLevel;
  num grndLevel;

  WeatherMainPart(
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
    this.seaLevel,
    this.grndLevel,
  );

  factory WeatherMainPart.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      return null;
    }
    return WeatherMainPart(
      json['temp'] as num,
      json['feels_like'] as num,
      json['temp_min'] as num,
      json['temp_max'] as num,
      json['pressure'] as num,
      json['humidity'] as num,
      json['sea_level'] as num,
      json['grnd_level'] as num,
    );
  }
}
