import 'package:flutter/material.dart';
import 'package:weather_apk/modals/weather_forecast_daily_one.dart';
import 'package:weather_apk/utilites/forecast_util.dart';

class CityView extends StatelessWidget {
  final AsyncSnapshot<WeatherForecast> snapshot;
  const CityView({this.snapshot});

  @override
  Widget build(BuildContext context) {
    var forecastList = snapshot.data.list;
    var city = snapshot.data.city.name;
    var country = snapshot.data.city.country;
    var fotmatedDate = DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);

    return Container(
      child: Column(
        children: <Widget>[
          Text(
            '$city, $country',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 28.0,
              color: Colors.black87,
            ),
          ),
          Text(
            '${Util.getFormattedDate(fotmatedDate)}',
            style: TextStyle(
              fontSize: 15.0,
            ),
          ),
        ],
      ),
    );
  }
}
