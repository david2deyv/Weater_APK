import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEEE, MMM d, y').format(dateTime);
  }

  static getItem(BuildContext context, IconData iconData, int value, String units) {
    final Color color = Theme.of(context).primaryColor;
    return Column(
      children: <Widget>[
        Icon(iconData, color: color, size: 28.0),
        SizedBox(height: 10.0),
        Text(
          '$value',
          style: TextStyle(fontSize: 20.0),
        ),
        SizedBox(height: 10.0),
        Text(
          '$units',
          style: TextStyle(fontSize: 15.0),
        ),
      ],
    );
  }
}
