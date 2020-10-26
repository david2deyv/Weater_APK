import 'package:flutter/material.dart';
import 'package:weather_apk/db/cities_dao.dart';
import 'package:weather_apk/db/city_entity.dart';

class CityList extends StatelessWidget {
  final CitiesDao citiesDao;

  CityList(this.citiesDao);

  List<CityEntity> cities = List();
  TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          writeCity(),
          SizedBox(height: 10),
          Expanded(
            child: cityList(),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          citiesDao.deleteAllCities(cities);
        },
      ),
    );
  }

  Widget cityList() {
    return StreamBuilder<List<CityEntity>>(
      stream: citiesDao.getAllCities(),
      builder: (_, data) {
        if (data.hasData) {
          cities = data.data;
          return ListView.builder(
            itemCount: data.data.length,
            itemBuilder: (_, position) {
              return Card(
                child: ListTile(
                  subtitle: Text(data.data[position].name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      citiesDao.deleteCiti(data.data[position]);
                    },
                  ),
                ),
              );
            },
          );
        } else if (data.hasError) {
          return Text('Error');
        } else
          return Text('Loading');
      },
    );
  }

  Widget writeCity() {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: city,
              decoration: InputDecoration(
                hintText: 'Enter City Name',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                    borderSide: BorderSide.none),
                icon: Icon(
                  Icons.location_city,
                  size: 50,
                ),
              ),
            ),
          ),
        ),
        FlatButton(
          child: Text('Add city', style: TextStyle(fontSize: 30)),
          onPressed: () {
            citiesDao.addCity(CityEntity(city.text));
            city.text = '';
          },
        ),
      ],
    );
  }
}
