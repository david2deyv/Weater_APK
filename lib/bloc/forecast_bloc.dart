import 'dart:async';
import 'package:weather_apk/api/weather_api.dart';
import 'package:weather_apk/api/weather_repository.dart';
import 'package:weather_apk/api/weather_target.dart';
import 'package:weather_apk/bloc/forecast_event.dart';
import 'package:weather_apk/bloc/forecast_state.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';
import 'package:weather_apk/utilites/location.dart';

class ForecastBloc {
  final StreamController<ForecastState> _stateController =
      StreamController.broadcast();
  final StreamController<ForecastEvent> _eventController = StreamController();
  final WeatherRepository _repository;
  WeatherTarget _target = WeatherTargetCity('Kyiv');

  Stream<ForecastState> get state =>
      _stateController.stream.asBroadcastStream();

  ForecastBloc(this._repository) {
    _loadWeather();
    _eventController.stream.listen(_handle);
  }

  Future<void> _handle(ForecastEvent event) async {
    if (event is ErrorEvent) {
      _stateController.sink.add(RetryState());
    } else if (event is ResetEvent) {
      _loadWeather();
    } else if (event is ChangeCityEvent) {
      _target = WeatherTargetCity(event.city);
      _loadWeather();
    } else if (event is LoadWeatherByLocation) {
      Location location = Location();
      await location.getCurrentLocation();

      _target = WeatherTargetLocation(location);
      _loadWeather();
    }
  }

  void handle(ForecastEvent event) => _eventController.sink.add(event);

  Future _loadWeather() async {
    _stateController.sink.add(LoadingState());

    try {
      final WeatherForecast forecast =
          await _repository.getWeatherApi(target: _target);
      _stateController.sink.add(LoadedState(forecast));
    } on WrongCityException catch (_) {
      _stateController.sink.add(WrongCityState());
    } catch (_) {
      _stateController.sink.add(RetryState());
    }
  }
}
