import 'dart:convert';
import 'dart:developer';
// import 'dart:html';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/utilites/constsns.dart';
import 'package:http/http.dart' as http;
import 'package:weather_apk/utilites/location.dart';

class WrongCityException implements Exception {
  const WrongCityException();
}

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastByCity(
      {@required String cityName}) async {
    Map<String, String> parameters = {
      'q': cityName,
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
    };

    return _fetchWeather(parameters);
  }

  Future<WeatherForecast> fetchWeatherForecastByLocation(
      {@required Location location}) async {
    Map<String, String> parameters = {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'APPID': Constants.WEATHER_APP_ID,
      'units': 'metric',
    };

    return _fetchWeather(parameters);
   
  }

  Future<WeatherForecast> _fetchWeather(Map<String, String> params) async {
    final Uri uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, params);

    log('reauest: ${uri.toString()}');

    final Response response = await http.get(uri);

    print('response: ${response?.body}');

    print(response.statusCode.toString());

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else if (response.statusCode == 404) {
      return Future.error(WrongCityException());
    } else {
      return Future.error('Error responce');
    }
  }
}
