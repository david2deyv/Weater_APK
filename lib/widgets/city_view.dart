import 'package:flutter/material.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/utilites/forecast_util.dart';

class CityView extends StatelessWidget {
  final City city;
  final DateTime date;

  const CityView({
    Key key,
    @required this.city,
    @required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${city.name}, ${city.country}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
     
          ),
        ),
        Text(
          '${Util.getFormattedDate(date)}',
          style: TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
