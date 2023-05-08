import 'package:flutter/material.dart';
import 'page/home/home_page.dart';
import 'page/settings/settings_page.dart';

final Map<String, Widget Function(BuildContext context)> routes = <String, Widget Function(BuildContext context)> {
  '/home':          (context) => HomePage(),
  '/settings':      (context) => SettingsPage(),
};