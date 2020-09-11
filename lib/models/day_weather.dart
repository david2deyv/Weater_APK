import 'package:meta/meta.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';

/// Holds weather forecasts for a day
class DayWeather {
  DayWeather(this.forecastList);

  factory DayWeather.fromForecast({
    @required WeatherForecast forecast,
    @required DateTime day,
  }) {
    final List<WeatherList> allForecasts = forecast.list;
    final List<WeatherList> result = [];

    for (WeatherList dayForecast in allForecasts) {
      final DateTime date = DateTime.fromMillisecondsSinceEpoch(dayForecast.dt * 1000);
      if (date.day == day.day) {
        result.add(dayForecast);
      }
    }

    return DayWeather(result);
  }

  /// Forecasts for particular day
  final List<WeatherList> forecastList;

  double get averageTemp {
    double temp = 0;
    forecastList.forEach((forecast) => temp += forecast.main.temp);

    return temp / forecastList.length;
  }

  String get iconUrl => forecastList.first.getIconUrl();

  DateTime get date => DateTime.fromMillisecondsSinceEpoch(forecastList.first.dt * 1000);

  // todo implement
  double get tempMin => throw UnimplementedError();

  // todo implement
  double get tempMax => throw UnimplementedError();
}
