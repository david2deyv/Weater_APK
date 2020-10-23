import 'package:flutter/material.dart';

class AppThemes {
  static int get themesCount => getThemes(null).length;

  static List<ThemeData> getThemes(BuildContext context) => [
        ThemeData(
          primaryColor: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.blueGrey,
          backgroundColor: Colors.blueGrey[400],
          accentColor: Colors.cyan[200],
          brightness: Brightness.light,
          textTheme: context != null ? Theme.of(context).textTheme.apply(
                bodyColor: Colors.cyan[200],
                decorationColor: Colors.purple,
                displayColor: Colors.purple,
              ) : TextTheme(),
        ),
                ThemeData(
          primaryColor: Colors.red[200],
          scaffoldBackgroundColor: Colors.red[300],
          backgroundColor: Colors.red[200],
          accentColor: Colors.white70,
          brightness: Brightness.light,
          textTheme: context != null ? Theme.of(context).textTheme.apply(
                bodyColor: Colors.white70,
                decorationColor: Colors.blue,
                displayColor: Colors.green,
              ) : TextTheme(),
        ),
        ThemeData(
          primaryColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          accentColor: Colors.black87,
          brightness: Brightness.light,
                textTheme: context != null ? Theme.of(context).textTheme.apply(
                bodyColor: Colors.black87,
                decorationColor: Colors.white,
                displayColor: Colors.white,
              ) : TextTheme(),
        ),
  ];
}
