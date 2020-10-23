import 'package:flutter/material.dart';


import 'package:weather_apk/bloc/forecast_event.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {

  String cityName;


  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).accentColor;
    final Color backgroundColor = Theme.of(context).backgroundColor;


    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    cursorColor: backgroundColor,
                    style: TextStyle(color: backgroundColor),
                    decoration: InputDecoration(
                      hintText: 'Enter City Name',
                      hintStyle: TextStyle(color: backgroundColor),
                      filled: true,
                      fillColor: primaryColor,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide.none),
                      icon: Icon(
                        Icons.location_city,
                        color: primaryColor,
                        size: 50,
                      ),
                    ),
                    onChanged: (value) {
                      cityName = value;
                    },
                  ),
                ),
              ),
              FlatButton(
                  child: Text('Add city', style: TextStyle(fontSize: 30, color: primaryColor)),
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  }),
              //todo show cities list
            ],
          ),
        ),
      ),
    );
  }
}
