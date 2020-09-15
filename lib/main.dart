import 'package:flutter/material.dart';
import 'package:weather_apk/screens/location_screen.dart';

// import 'package:weather_apk/screens/weather_forecst_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LocationScreen(),
    );
  }
}
