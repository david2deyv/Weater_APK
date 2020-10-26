import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_apk/api/weather_target.dart';
import 'package:weather_apk/db/city_entity.dart';
import 'package:weather_apk/db/db.dart';
import 'package:weather_apk/screens/city_list.dart';
import 'package:weather_apk/screens/weather_forecst_screen.dart';
import 'package:weather_apk/theme/theme_bloc.dart';
import 'package:weather_apk/theme/themes.dart';

// import 'package:weather_apk/screens/weather_forecst_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final AppDatabase db = await $FloorAppDatabase.databaseBuilder(AppDatabase.name).build();
  // await db.citiesDao.insertCity(CityEntity.create(WeatherTargetCity('Miami')));
  // final res = await db.citiesDao.getAllCities();
  // log(res.toString());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ThemeBloc _bloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    // return StreamBuilder<int>(
    //     initialData: 0,
    //     stream: _bloc.state,
    //     builder: (context, snapshot) {
    //       print(snapshot);
    //       if (snapshot.hasData) {
    //         final int theme = snapshot.data;
    //         return MaterialApp(
    //           theme: AppThemes.getThemes(context)[theme],
    //           home: Provider(
    //             create: (context) => _bloc,
    //             child: WeatherForecastScreen(),
    //           ),
    //         );
    //       } else {
    //         return Container();
    //       }
    //     });


    return MaterialApp(
      home: FutureBuilder<AppDatabase>(
        future: $FloorAppDatabase.databaseBuilder('city.db').build(),
        builder: (context, data) {
          if(data.hasData) {
            return CityList(data.data.citiesDao);
          }
          if(data.hasError) {
            return Text('Error');
          }
          return Text('Loading');
        },
      ),
    );
  }
}
