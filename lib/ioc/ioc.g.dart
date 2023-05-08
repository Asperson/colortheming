// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ioc.dart';

// **************************************************************************
// KiwiInjectorGenerator
// **************************************************************************

class _$Ioc extends Ioc {
  @override
  void configure() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerSingleton<SettingsService>((c) => SettingsServiceImpl())
      ..registerFactory((c) => HomeModel(c<SettingsService>()))
      ..registerFactory((c) => SettingsModel(c<SettingsService>()));
  }
}
