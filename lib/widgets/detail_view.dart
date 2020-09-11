import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/utilites/forecast_util.dart';

class DetailView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const DetailView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var pressure = forecastList[0].main.pressure * 0.750062;
    var humidity = forecastList[0].main.humidity;
    var windSpeed = forecastList[0].wind.speed;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Util.getItem(FontAwesomeIcons.thermometerThreeQuarters,
              pressure.round(), 'mm Hg'),
          Util.getItem(FontAwesomeIcons.cloudRain, humidity, '%'),
          Util.getItem(FontAwesomeIcons.wind, windSpeed.toInt(), 'm/s'),
        ],
      ),
    );
  }
}
