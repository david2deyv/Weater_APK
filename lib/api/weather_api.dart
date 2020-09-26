import 'dart:convert';
import 'dart:developer';
// import 'dart:html';

import 'package:http/http.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/utilites/constsns.dart';
import 'package:http/http.dart' as http;
import 'package:weather_apk/utilites/location.dart';

class WrongCityException implements Exception {
  const WrongCityException();
}

class WeatherApi {
  // TODO Refactor. Pass location as parameter
  Future<WeatherForecast> fetchWeatherForecast(
      {String cityName, bool isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> parameters;
    if (isCity == true) {
      Map<String, String> queryParameters = {
        'q': cityName,
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
      };
      parameters = queryParameters;
    } else {
      Map<String, String> queryParameters = {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
      };
      parameters = queryParameters;
    }

    final Uri uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    log('reauest: ${uri.toString()}');

    final Response response = await http.get(uri);

    print('response: ${response?.body}');

    print(response.statusCode.toString());

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else if(response.statusCode == 404) {
      return Future.error(WrongCityException());
    } else {
      return Future.error('Error responce');
    }
  }
}
