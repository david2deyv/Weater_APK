import 'package:flutter/material.dart';
import 'package:weather_apk/models/day_weather.dart';
import 'package:weather_apk/theme/theme_bloc.dart';
import 'package:weather_apk/utilites/forecast_util.dart';

Widget forecastCard(DayWeather dayWeather, BuildContext context) {
  final String fullDate = Util.getFormattedDate(dayWeather.date);
  final String dayOfWeek = fullDate.substring(0, 3);
  final String averageTemp = dayWeather.averageTemp.toStringAsFixed(0);
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            dayOfWeek,
            style: TextStyle(fontSize: 25),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '$averageTemp °С',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ),
          Image.network(
            dayWeather.iconUrl,
            scale: 1.2,
            color: Theme.of(context).accentColor,
            // color: Theme.of(context).accentColor,
          ),
        ],
      ),
    ],
  );
}
