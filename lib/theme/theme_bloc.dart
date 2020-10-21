import 'dart:async';
import 'dart:ffi';

import 'package:weather_apk/theme/theme_event.dart';
import 'package:weather_apk/theme/theme_state.dart';
import 'package:weather_apk/theme/themes.dart';

class ThemeBloc {
  final StreamController<int> _stateController = StreamController.broadcast();
  final StreamController<ThemeEvent> _eventController = StreamController();
  int _themeIndex = 0;

  Stream<int> get state => _stateController.stream.asBroadcastStream();

  ThemeBloc() {
    _changeTheme();
    _eventController.stream.listen(_handle);
  }

  void handle(ThemeEvent event) => _eventController.sink.add(event);

  void _handle(ThemeEvent event) {
    if (event is ChangeTheme) {
      _themeIndex++;
      if (_themeIndex >= AppThemes.themesCount) {
        _themeIndex = 0;
      }
      _changeTheme();
    }
  }

  void _changeTheme() {
    _stateController.sink.add(_themeIndex);
  }
}
