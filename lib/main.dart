import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_apk/screens/weather_forecst_screen.dart';
import 'package:weather_apk/theme/theme_bloc.dart';
import 'package:weather_apk/theme/themes.dart';

// import 'package:weather_apk/screens/weather_forecst_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeBloc _bloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
        initialData: 0,
        stream: _bloc.state,
        builder: (context, snapshot) {
          print(snapshot);
          if (snapshot.hasData) {
            final int theme = snapshot.data;
            return MaterialApp(
              theme: AppThemes.getThemes(context)[theme],
              home: Provider(
                create: (context) => _bloc,
                child: WeatherForecastScreen(),
              ),
            );
          } else {
            return Container();
          }
        });
    // return MaterialApp(
    //   theme: AppThemes.getThemes(context)[0],
    //   home: WeatherForecastScreen(),
    // );
  }
}
