import 'package:colortheming/common/theme_util.dart';
import 'package:colortheming/ioc/ioc.dart';
import 'package:colortheming/model/settings.dart';
import 'package:colortheming/page/home/home_page.dart';
import 'package:colortheming/routes.dart';
import 'package:colortheming/service/initialization_service.dart';
import 'package:colortheming/service/settings_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await InitializationService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var settingsService = container<SettingsService>();

    return StreamProvider<Settings>(
      initialData: settingsService.current,
      create: (context) => settingsService.settingsController.stream,
      updateShouldNotify: (_, __) => true,
      child: Consumer<Settings>(
        builder: (context, settings, _) {
          return MaterialApp(
            title: 'Tip Calculator',
            theme: getLightThemeData(settings.theme),
            darkTheme: getDarkThemeData(settings.theme),
            themeMode: settings.themeMode,
            home: const HomePage(),
            routes: routes,
          );
        },
      ),
    );
  }
}
