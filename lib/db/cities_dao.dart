import 'package:floor/floor.dart';
import 'package:weather_apk/db/city_entity.dart';

@dao
abstract class CitiesDao {
@Query('SELECT * FROM cities')
Stream<List<CityEntity>> getAllCities();

// @Query('SELECT * FROM cities WHERE id = :id')
// Stream<CityEntity> findCityById(int id);

@insert
Future<void> addCity(CityEntity city);

@delete
Future<void> deleteAllCities(List<CityEntity> city);

@delete
Future<void> deleteCiti(CityEntity cities);


}