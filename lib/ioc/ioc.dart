import 'package:colortheming/page/home/home_model.dart';
import 'package:colortheming/page/settings/settings_model.dart';
import 'package:colortheming/service/settings_service.dart';
import 'package:kiwi/kiwi.dart';

part 'ioc.g.dart';

KiwiContainer get container => KiwiContainer();

abstract class Ioc {
  static Future initialize() async {
    final iocSetup = _$Ioc();

    iocSetup.configure();
  }

  // Repos
//  @Register.singleton(ObjectBox)

  // Instrumentation
  @Register.singleton(SettingsService, from: SettingsServiceImpl) // singleton because has settings change notification stream

  // Page view models
  @Register.factory(HomeModel)
  @Register.factory(SettingsModel)
  
  void configure();
}
