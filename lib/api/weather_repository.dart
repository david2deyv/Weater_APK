import 'package:weather_apk/api/weather_api.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';

abstract class WeatherRepository {
  // TODO change to one param. smth like WeatherProvider
  Future<WeatherForecast> getWeatherApi({String city, bool isCity});
}

class WeatherRepositoryImpl implements WeatherRepository {
  WeatherApi _weatherApi = WeatherApi();
  Future<WeatherForecast> getWeatherApi({String city, bool isCity}) {
    // TODO Use isCity parameter 
    return _weatherApi.fetchWeatherForecast(cityName: city, isCity: isCity);
  }
}

class WeatherRepositoryMock implements WeatherRepository {
  @override
  Future<WeatherForecast> getWeatherApi({String city, bool isCity}) async {
    return WeatherForecast(city: City(name: 'London', country: 'EN'));
  }
}
