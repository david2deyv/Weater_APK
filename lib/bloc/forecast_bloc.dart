import 'dart:async';
import 'package:weather_apk/api/weather_api.dart';
import 'package:weather_apk/api/weather_repository.dart';
import 'package:weather_apk/bloc/forecast_event.dart';
import 'package:weather_apk/bloc/forecast_state.dart';
import 'package:weather_apk/models/weather_forecast_daily_one.dart';

class ForecastBloc {
  final StreamController<ForecastState> _stateController =
      StreamController.broadcast();
  final StreamController<ForecastEvent> _eventController = StreamController();
  final WeatherRepository _repository;
  String _city = 'Kiev';
  bool _isCity = false;

  Sink<ForecastEvent> get event => _eventController.sink;
  Stream<ForecastState> get state =>
      _stateController.stream.asBroadcastStream();

  ForecastBloc(this._repository) {
    _loadWeather();
    _eventController.stream.listen(_handle);
  }

  void _handle(ForecastEvent event) {
    if (event is ErrorEvent) {
      _stateController.sink.add(RetryState());
    } else if (event is ResetEvent) {
      _loadWeather();
    } else if (event is ChangeCityEvent) {
      _city = event.city;
      _isCity = true;
      _loadWeather();
    } else if (event is LoadWeatherByLocation) {
      _isCity = false;
      _loadWeather();
    }
  }

  Future _loadWeather() async {
    _stateController.sink.add(LoadingState());

    try {
      final WeatherForecast forecast =
          await _repository.getWeatherApi(city: _city, isCity: _isCity);
      _stateController.sink.add(LoadedState(forecast));
    } on WrongCityException catch (_) {
      _stateController.sink.add(WrongCityState());
    } catch (_) {
      _stateController.sink.add(RetryState());
    }
  }
}
