import 'package:colortheming/common/enums.dart';
import 'package:colortheming/page/base/base_model.dart';
import 'package:colortheming/service/settings_service.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

enum DisplayTheme {
  material(flexScheme: FlexScheme.material),
  blue(flexScheme: FlexScheme.blue),
  indigo(flexScheme: FlexScheme.indigo),
  brandBlue(flexScheme: FlexScheme.brandBlue),
  deepBlue(flexScheme: FlexScheme.deepBlue),
  greyLaw(flexScheme: FlexScheme.greyLaw),
  vesuviusBurn(flexScheme: FlexScheme.vesuviusBurn),
  ebonyClay(flexScheme: FlexScheme.ebonyClay),
  bigStone(flexScheme: FlexScheme.bigStone),
  espresso(flexScheme: FlexScheme.espresso),
  blueWhale(flexScheme: FlexScheme.blueWhale);

  final FlexScheme flexScheme;

  const DisplayTheme({required this.flexScheme});

  static DisplayTheme fromFlexScheme(FlexScheme flexScheme) {
    var flexName = flexScheme.toString().split('.')[1];
    return DisplayTheme.values.firstWhere((el) => el.toString().contains(flexName), orElse: () => DisplayTheme.material);
  }
}

class SettingsModel extends BaseModel {
  // Services
  final SettingsService _settingsService;

  // Data
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  DisplayTheme currentTheme = DisplayTheme.material;
  ThemeMode currentMode = ThemeMode.system;

  SettingsModel(this._settingsService);

  // API -------------------------------
  Future fetchData() async {
    setState(ViewState.busy);

    packageInfo = await PackageInfo.fromPlatform();
    var settings = _settingsService.current;
    currentTheme = DisplayTheme.fromFlexScheme(settings.theme);
    currentMode = settings.themeMode;

    setState(ViewState.idle);
  }

  Future changeTheme(DisplayTheme theme) async {
    setState(ViewState.busy);

    _settingsService.current.theme = theme.flexScheme;
    currentTheme = theme;
    await _settingsService.saveCurrent();

    setState(ViewState.idle);
  }

  Future changeThemeMode(ThemeMode mode) async {
    setState(ViewState.busy);

    _settingsService.current.themeMode = mode;
    currentMode = mode;
    await _settingsService.saveCurrent();

    setState(ViewState.idle);
  }
}
