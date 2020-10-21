import 'package:flutter/material.dart';

class AppThemes {
  static int get themesCount => getThemes(null).length;

  static List<ThemeData> getThemes(BuildContext context) => [
        ThemeData(
          primaryColor: Colors.blueGrey,
          scaffoldBackgroundColor: Colors.blueGrey,
          backgroundColor: Colors.blueGrey,
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
        // ThemeData(
        //   primaryColor: Colors.grey,
        //   scaffoldBackgroundColor: Colors.grey,
        //   backgroundColor: Colors.grey,
        //   accentColor: Colors.green,
        //   brightness: Brightness.dark,
        //         textTheme: context != null ? Theme.of(context).textTheme.apply(
        //         bodyColor: Colors.black,
        //         decorationColor: Colors.white,
        //         displayColor: Colors.white,
        //       ) : TextTheme(),
        //   // textTheme: const TextTheme().apply(
        //   //   bodyColor: Colors.white,
        //   //   decorationColor: Colors.white,
        //   //   displayColor: Colors.white,
        //   // ),
        // ),
      ];
}
