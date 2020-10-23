// required package imports
import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:weather_apk/db/cities_dao.dart';
import 'package:weather_apk/db/city_entity.dart';

part 'db.g.dart';

@Database(version: 1, entities: [CityEntity])
abstract class AppDatabase extends FloorDatabase {
  static const name = 'database.db';
  CitiesDao get citiesDao;
}