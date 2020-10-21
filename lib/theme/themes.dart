import 'package:flutter/material.dart';

class AppThemes {
  static int get themesCount => getThemes(null).length;

  static List<ThemeData> getThemes(BuildContext context) => [
        ThemeData(
          primaryColor: Colors.yellow,
          scaffoldBackgroundColor: Colors.yellow[400],
          backgroundColor: Colors.yellow[300],
          accentColor: Colors.purple,
          brightness: Brightness.light,
          textTheme: context != null ? Theme.of(context).textTheme.apply(
                bodyColor: Colors.purple,
                decorationColor: Colors.purple,
                displayColor: Colors.purple,
              ) : TextTheme(),
        ),
                ThemeData(
          primaryColor: Colors.red,
          scaffoldBackgroundColor: Colors.red,
          backgroundColor: Colors.red[300],
          accentColor: Colors.white,
          brightness: Brightness.light,
          textTheme: context != null ? Theme.of(context).textTheme.apply(
                bodyColor: Colors.white,
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
