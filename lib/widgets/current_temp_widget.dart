import 'package:flutter/material.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';

class CurrentTempWidget extends StatelessWidget {
  final ForecastItem forecast;

  const CurrentTempWidget({Key key, this.forecast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dynamic color = Theme.of(context).accentColor;
    final String icon = forecast.getIconUrl();
    final String temp = forecast.main.temp.toStringAsFixed(0);
    final String description = forecast.weather[0].description.toUpperCase();


    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.network(
          icon,
          scale: 0.7,
          color: color,
        ),
        SizedBox(width: 20.0),
        Column(
          children: <Widget>[
            Text(
              '$temp °С',
              style: TextStyle(
                fontSize: 54.0,
              ),
            ),
            Text(
              '$description',
              style: TextStyle(fontSize: 18.0,),
            ),
          ],
        ),
      ],
    );
  }
}
