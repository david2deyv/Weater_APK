import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:weather_apk/api/weather_api.dart';
import 'package:weather_apk/api/weather_repository.dart';
import 'package:weather_apk/bloc/forecast_bloc.dart';
import 'package:weather_apk/bloc/forecast_event.dart';
import 'package:weather_apk/bloc/forecast_state.dart';
// import 'package:weather_apk/bloc/user_bloc.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/screens/city_screen.dart';
import 'package:weather_apk/theme/theme_bloc.dart';
import 'package:weather_apk/theme/theme_event.dart';
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
  final ForecastBloc _bloc = ForecastBloc(WeatherRepositoryImpl());
  ThemeBloc _themeBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _themeBloc = Provider.of<ThemeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('openweathermap.org'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () => _themeBloc.handle(ChangeTheme()),
          ),
          IconButton(
            icon: Icon(Icons.location_city),
            onPressed: () async {
              openCityNameScreen();
            },
          ),
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () => _bloc.handle(LoadWeatherByLocation()),
          ),
        ],
      ),
      body: StreamBuilder<ForecastState>(
        initialData: LoadingState(),
        stream: _bloc.state,
        builder: (context, snapshot) {
          log(snapshot.toString());
          if (snapshot.hasData) {
            final ForecastState state = snapshot.data;
            if (state is LoadingState) {
              return Center(
                child: SpinKitDoubleBounce(
                  color: Colors.black87,
                  size: 100,
                ),
              );
            } else if (state is RetryState) {
              return Center(
                child: FlatButton(
                  child: Text('RETRY'),
                  onPressed: () => _bloc.handle(ResetEvent()),
                ),
              );
            } else if (state is WrongCityState) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'City not found\nPlease, enter correct city',
                      style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                    ),
                    FlatButton(
                      child: Text(
                        'RETRY',
                        style: TextStyle(fontSize: 20, color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () async {
                        openCityNameScreen();
                      },
                    ),
                  ],
                ),
              );
            } else {
              final WeatherForecast weatherForecast =
                  (state as LoadedState).forecast;
              final ForecastItem currentForecast = weatherForecast.list.first;
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
            }
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
    );
  }

  void openCityNameScreen() async {
    String tappedName =
        await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CityScreen();
    }));
    if (tappedName != null) {
      _bloc.handle(ChangeCityEvent(tappedName));
    }
  }
}
