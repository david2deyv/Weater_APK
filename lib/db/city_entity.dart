import 'package:floor/floor.dart';
import 'package:weather_apk/api/weather_target.dart';

@Entity(tableName: 'cities')
class CityEntity {
  CityEntity(this.id, this.name, this.lat, this.lon, this.selected);

  factory CityEntity.create(WeatherTarget target, bool selected) {
    if(target is WeatherTargetCity) {
      return CityEntity._(null, target.cityName, null, null, selected);
    } else if (target is WeatherTargetLocation){
      final location = target.location;
      return CityEntity._(null, null, location.latitude, location.longitude, selected);
    } else {
      throw Exception('Unknown target: $target');
    }
  }

  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final double lat;
  final double lon;
  final bool selected;

  @override
  String toString() {
    return 'CityEntity{id: $id, name: $name, lat: $lat, lon: $lon}';
  }
}