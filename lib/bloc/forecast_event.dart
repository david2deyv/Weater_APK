import 'package:weather_apk/bloc/forecast_state.dart';

abstract class ForecastEvent {}

class ErrorEvent implements ForecastEvent {}

class ResetEvent implements ForecastEvent {}

class ChangeCityEvent implements ForecastEvent {
  String city;

  ChangeCityEvent(this.city);
}


class LoadWeatherByLocation implements ForecastEvent {}