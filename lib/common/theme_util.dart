import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

ThemeData getLightThemeData(FlexScheme flexScheme) {
  return FlexThemeData.light(
    scheme: flexScheme,
    surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    blendLevel: 20,
    appBarOpacity: 0.95,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 20,
      blendOnColors: false,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  );
}

ThemeData getDarkThemeData(FlexScheme flexScheme) {
  return FlexThemeData.dark(
    scheme: flexScheme,
    surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,
    blendLevel: 15,
    appBarOpacity: 0.90,
    subThemesData: const FlexSubThemesData(
      blendOnLevel: 30,
    ),
    visualDensity: FlexColorScheme.comfortablePlatformDensity,
  );
}

ThemeData findCurrentThemData(ThemeData light, ThemeData dark, ThemeMode mode) {
  switch (mode) {
    case ThemeMode.light:
      return light;
    case ThemeMode.dark:
      return dark;
    case ThemeMode.system:
      return isSystemDarkMode() ? dark : light;
    default:
      return light;
  }
}

bool isSystemDarkMode() {
  final darkMode = WidgetsBinding.instance.window.platformBrightness;
  if (darkMode == Brightness.dark) {
    return true;
  } else {
    return false;
  }
}
