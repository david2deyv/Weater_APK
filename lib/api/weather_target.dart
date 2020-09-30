import 'package:weather_apk/bloc/forecast_event.dart';
import 'package:weather_apk/utilites/location.dart';

abstract class WeatherTarget {}

class WeatherTargetCity implements WeatherTarget {
  const WeatherTargetCity(this.cityName);

  final String cityName;
}

class WeatherTargetLocation implements WeatherTarget {
  const WeatherTargetLocation(this.location);

  final Location location;
}
