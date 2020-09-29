import 'package:weather_apk/models/weather_forecast_daily_one.dart';

abstract class ForecastState {}

class LoadingState implements ForecastState {}

class LoadedState implements ForecastState {
  final WeatherForecast forecast;

  LoadedState(this.forecast);
}

class RetryState implements ForecastState {}


class WrongCityState implements ForecastState {}