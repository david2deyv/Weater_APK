import 'dart:convert';
import 'dart:developer';

import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/utilites/constsns.dart';
import 'package:http/http.dart' as http;
import 'package:weather_apk/utilites/location.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String cityName, bool isCity}) async {
    Location location = Location();
    await location.getCurrentLocation();

    Map<String, String> parameters;
    if (isCity == true) {
      var queryParameters = {
        'q': cityName,
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
      };
      parameters = queryParameters;
    } else {
      var queryParameters = {
        'lat': location.latitude.toString(),
        'lon': location.longitude.toString(),
        'APPID': Constants.WEATHER_APP_ID,
        'units': 'metric',
      };
      parameters = queryParameters;
    }

    var uri = Uri.https(Constants.WEATHER_BASE_URL_DOMAIN,
        Constants.WEATHER_FORECAST_PATH, parameters);

    log('reauest: ${uri.toString()}');

    var response = await http.get(uri);

    print('response: ${response?.body}');

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      return Future.error('Error responce');
    }
  }
}
