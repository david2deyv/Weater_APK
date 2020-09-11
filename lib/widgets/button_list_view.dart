import 'package:flutter/material.dart';
import 'package:weather_apk/models/day_weather.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/widgets/forecast_card.dart';

class ButtonListView extends StatelessWidget {
  const ButtonListView({this.snapshot});

  static const daysAmount = 5;
  final AsyncSnapshot<WeatherForecast> snapshot;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '5-Day Weather Forecast'.toUpperCase(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 140,
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 8),
            itemCount: daysAmount,
            itemBuilder: (context, index) {
              final DayWeather dayWeather = _mapDayWeather(
                forecast: snapshot.data,
                day: _getDayByIndex(index),
              );

              return Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 160,
                color: Colors.black87,
                child: forecastCard(dayWeather),
              );
            },
          ),
        ),
      ],
    );
  }

  DayWeather _mapDayWeather({WeatherForecast forecast, DateTime day}) {
    // 40 elements here
    final List<WeatherList> allForecasts = forecast.list;
    // Our future result
    final List<WeatherList> result = [];

    for (WeatherList dayForecast in allForecasts) {
      final DateTime date = DateTime.fromMillisecondsSinceEpoch(dayForecast.dt * 1000);
      if (date.day == day.day) {
        result.add(dayForecast);
      }
    }

    return DayWeather(result);
  }

  DateTime _getDayByIndex(int index) {
    final DateTime now = DateTime.now();
    DateTime res = now.add(Duration(days: index));
    return res;
  }
}
