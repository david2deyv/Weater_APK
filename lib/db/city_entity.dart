import 'package:floor/floor.dart';
import 'package:weather_apk/api/weather_target.dart';

@Entity(tableName: 'cities')
class CityEntity {
  CityEntity(this.name, {this.id});

  // factory CityEntity.create(WeatherTarget target,) {
  //   if(target is WeatherTargetCity) {
  //     return CityEntity(null, target.cityName, null, null);
  //   } else if (target is WeatherTargetLocation){
  //     final location = target.location;
  //     return CityEntity(null, null, location.latitude, location.longitude);
  //   } else {
  //     throw Exception('Unknown target: $target');
  //   }
  // }

  @PrimaryKey(autoGenerate: true)
  final int id;

  final String name;
  // final double lat;
  // final double lon;
  // final bool selected;

  // @override
  // String toString() {
  //   return 'CityEntity{id: $id, name: $name, lat: $lat, lon: $lon}';
  // }
}