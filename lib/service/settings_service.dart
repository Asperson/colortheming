import 'dart:async';
import 'dart:convert';
import 'package:colortheming/model/settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SettingsService {
  Future<void> saveCurrent();

  StreamController<Settings> get settingsController; // to signal subscribers that current settings changed or updated
  Settings get current;

  Future<void> initialize();
}

//========================================================

class SettingsServiceImpl implements SettingsService {
  late StreamController<Settings> _settingsController;
  late Settings _current;
  late SharedPreferences _preferences;

  SettingsServiceImpl() {
    _settingsController = StreamController<Settings>();
  }

  @override
  Future<void> initialize() async {
    _preferences = await SharedPreferences.getInstance();

    String? settingsStr = _preferences.getString("settings"); // it's always 1
    if (settingsStr == null) {
      _current = Settings.empty();
      await saveCurrent();
    } else {
      _current = Settings.fromJson(jsonDecode(settingsStr));
    }
  }

  @override
  Future<void> saveCurrent() async {
    String settingsStr = jsonEncode(_current);

    _preferences.setString("settings", settingsStr);
    _settingsController.add(_current);
  }

  @override
  StreamController<Settings> get settingsController => _settingsController;

  @override
  Settings get current => _current;
}
