import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_apk/api/weather_api.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/screens/weather_forecst_screen.dart';

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  void getLocationData() async {
    try {
      WeatherForecast weatherInfo = await WeatherApi().fetchWeatherForecast();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WeatherForecastScreen(
          locationWeather: weatherInfo,
        );
      }));
    } catch (e) {
      print('$e');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.black87,
          size: 100,
        ),
      ),
    );
  }
}
