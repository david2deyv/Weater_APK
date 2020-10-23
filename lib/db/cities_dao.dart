import 'package:floor/floor.dart';
import 'package:weather_apk/db/city_entity.dart';

@dao
abstract class CitiesDao {
@Query('SELECT * FROM cities')
Future<List<CityEntity>> getAllCities();

@Query('SELECT * FROM cities WHERE id = :id')
Stream<CityEntity> findCityById(int id);

@Insert(onConflict: OnConflictStrategy.replace)
Future<void> insertCity(CityEntity city);

//todo add delete all method
//todo add deleteById method
}