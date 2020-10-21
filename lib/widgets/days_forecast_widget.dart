import 'package:flutter/material.dart';
import 'package:weather_apk/models/day_weather.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/widgets/forecast_card.dart';

class DaysForecastWidget extends StatelessWidget {
  const DaysForecastWidget({this.days});

  final List<DayWeather> days;

  @override
  Widget build(BuildContext context) {
    final Color cardBackgroundColor = Theme.of(context).backgroundColor;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '5-Day Weather Forecast'.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: days.length,
            itemBuilder: (context, int index) {
              return Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                color: Theme.of(context).primaryColor,
                child: forecastCard(days[index]),
              );
            },
          ),
        ),
      ],
    );
  }

}
