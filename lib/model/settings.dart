import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'settings.g.dart';

@JsonSerializable()
class Settings {
  late FlexScheme theme;
  late ThemeMode themeMode;

  Settings({required this.theme, required this.themeMode});

  factory Settings.empty() => Settings(theme: FlexScheme.material, themeMode: ThemeMode.light);

  // Json serializable
  factory Settings.fromJson(Map<String, dynamic> json) => _$SettingsFromJson(json);
  Map<String, dynamic> toJson() => _$SettingsToJson(this);
}
