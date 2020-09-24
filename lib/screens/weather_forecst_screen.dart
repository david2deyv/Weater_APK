import 'package:flutter/material.dart';
import 'package:weather_apk/api/weather_api.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/screens/city_screen.dart';
import 'package:weather_apk/widgets/days_forecast_widget.dart';
import 'package:weather_apk/widgets/city_view.dart';
import 'package:weather_apk/widgets/detail_view.dart';
import 'package:weather_apk/widgets/current_temp_widget.dart';

class WeatherForecastScreen extends StatefulWidget {
  final locationWeather;
  WeatherForecastScreen({this.locationWeather});

  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  Future<WeatherForecast> forecastObject;
  String _cityName = 'London';

  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = Future.value(widget.locationWeather);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('openweathermap.org'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.my_location),
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              String tappedName = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return CityScreen();
              }));
              if (tappedName != null) {
                _cityName = tappedName;
                setState(() {
                  forecastObject = WeatherApi()
                      .fetchWeatherForecast(cityName: _cityName, isCity: true);
                });
              }
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: FutureBuilder<WeatherForecast>(
              future: forecastObject,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final WeatherForecast weatherForecast = snapshot.data;
                  final ForecastItem currentForecast =
                      weatherForecast.list.first;
                  final City city = weatherForecast.city;
                  final DateTime date = DateTime.fromMillisecondsSinceEpoch(
                      currentForecast.dt * 1000);

                  return Column(
                    children: <Widget>[
                      SizedBox(height: 50.0),
                      CityView(city: city, date: date),
                      SizedBox(height: 50.0),
                      CurrentTempWidget(forecast: currentForecast),
                      SizedBox(height: 50.0),
                      DetailView(forecastItem: currentForecast),
                      SizedBox(height: 50.0),
                      DaysForecastWidget(days: weatherForecast.daysForecast)
                    ],
                  );
                } else {
                  return Center(
                    child: Text(
                      'City not found\nPlease, enter correct city',
                      style: TextStyle(fontSize: 25),
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
