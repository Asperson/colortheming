import 'package:colortheming/ioc/ioc.dart';
import 'package:colortheming/service/settings_service.dart';
import 'package:flutter/material.dart';

class InitializationService {
  static Future initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await Ioc.initialize();

    await container<SettingsService>().initialize();
  }
}
