import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/utilites/forecast_util.dart';

class DetailView extends StatelessWidget {
  final ForecastItem forecastItem;
  const DetailView({this.forecastItem});

  @override
  Widget build(BuildContext context) {
    final double pressure = forecastItem.main.pressure * 0.750062;
    final int humidity = forecastItem.main.humidity;
    final double windSpeed = forecastItem.wind.speed;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
            pressure.round(), 'mm Hg'),
        Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
        Util.getItem(FontAwesomeIcons.wind, windSpeed.toInt(), 'm/s'),
      ],
    );
  }
}
