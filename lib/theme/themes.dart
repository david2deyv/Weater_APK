import 'package:flutter/material.dart';

class AppThemes {
  static int get themesCount => getThemes(null).length;

  static List<ThemeData> getThemes(BuildContext context) => [
        ThemeData(
          primaryColor: Colors.purple,
          scaffoldBackgroundColor: Colors.yellow[400],
          backgroundColor: Colors.purple[400],
          accentColor: Colors.yellow,
          brightness: Brightness.light,
          textTheme: context != null ? Theme.of(context).textTheme.apply(
                bodyColor: Colors.purple,
                decorationColor: Colors.red,
                displayColor: Colors.green,
              ) : TextTheme(),
        ),
                ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.white,
          backgroundColor: Colors.blue,
          accentColor: Colors.teal,
          brightness: Brightness.light,
          textTheme: context != null ? Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                decorationColor: Colors.black,
                displayColor: Colors.black,
              ) : TextTheme(),
        ),
        ThemeData(
          primaryColor: Colors.grey,
          scaffoldBackgroundColor: Colors.grey,
          backgroundColor: Colors.grey,
          accentColor: Colors.green,
          brightness: Brightness.dark,
                textTheme: context != null ? Theme.of(context).textTheme.apply(
                bodyColor: Colors.black,
                decorationColor: Colors.white,
                displayColor: Colors.white,
              ) : TextTheme(),
          // textTheme: const TextTheme().apply(
          //   bodyColor: Colors.white,
          //   decorationColor: Colors.white,
          //   displayColor: Colors.white,
          // ),
        ),
      ];
}
