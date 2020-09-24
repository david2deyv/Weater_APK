

import 'package:meta/meta.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';

/// Holds weather forecasts for a day
class DayWeather {
  DayWeather(this.forecastList);

  factory DayWeather.fromForecast({
    @required List<ForecastItem> allForecasts,
    @required DateTime day,
  }) {

    final List<ForecastItem> result = [];

    for (ForecastItem dayForecast in allForecasts) {
      final DateTime date =
          DateTime.fromMillisecondsSinceEpoch(dayForecast.dt * 1000);
      if (date.day == day.day) {
        result.add(dayForecast);
      }
    }

    return DayWeather(result);
  }

  /// Forecasts for particular day
  final List<ForecastItem> forecastList;

  double get averageTemp {
    double temp = 0;
    forecastList.forEach((forecast) => temp += forecast.main.temp);

    return temp / forecastList.length;
  }

  String get iconUrl => forecastList.first.getIconUrl();

  DateTime get date =>
      DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);

  // todo implement
  double get averageTempMin {
    double tempMin = 0;
    forecastList.forEach((forecast) => tempMin += forecast.main.tempMin);

    return tempMin / forecastList.length;
  }

  // todo implement
  double get averageTempMax {
    double tempMax = 0;
    forecastList.forEach((forecast) => tempMax += forecast.main.tempMax);
    
    return tempMax / forecastList.length;
  }
}
