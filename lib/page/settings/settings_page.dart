import 'package:colortheming/page/base/base_view.dart';
import 'package:colortheming/page/settings/settings_model.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SettingsPage extends StatefulWidget {
  @override
  State createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late List<DropdownMenuItem<DisplayTheme>> _themeItems;
  late List<DropdownMenuItem<ThemeMode>> _themeModeItems;

  @override
  void initState() {
    _themeItems = _prepareThemeItems();
    _themeModeItems = _prepareThemeModeItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<SettingsModel>(
        onModelReady: (model) => model.fetchData(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(title: const Text('Settings')),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    // Theme
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: [
                                Text("Theme", style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18)),
                                const Spacer(),
                                DropdownButton<DisplayTheme>(
                                  isDense: false,
                                  value: model.currentTheme,
                                  onChanged: (theme) {
                                    model.changeTheme(theme!);
                                  },
                                  items: _themeItems,
                                )
                              ],
                            ),
                            Text("Try and choose your favorite theme", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12)),
                            Container(height: 15)
                          ],
                        ),
                      ),
                    ),

                    const Divider(height: 5),

                    // Theme mode
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Theme Mode", style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18)),
                                const Spacer(),
                                DropdownButton<ThemeMode>(
                                    value: model.currentMode,
                                    onChanged: (mode) {
                                      model.changeThemeMode(mode!);
                                    },
                                    items: _themeModeItems)
                              ],
                            ),
                            Text("Light or dark", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12)),
                            Container(height: 15)
                          ],
                        ),
                      ),
                    ),
                    const Divider(height: 5),
                    Text("Version ${model.packageInfo.version}, build ${model.packageInfo.buildNumber}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 12))
                  ],
                ),
              ),
            ));
  }

  List<DropdownMenuItem<DisplayTheme>> _prepareThemeItems() {
    var items = <DropdownMenuItem<DisplayTheme>>[];
    for (var value in DisplayTheme.values) {
      items.add(
        DropdownMenuItem(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(EnumToString.convertToString(value, camelCase: true)),
          ),
        ),
      );
    }
    return items;
  }

  List<DropdownMenuItem<ThemeMode>> _prepareThemeModeItems() {
    var items = <DropdownMenuItem<ThemeMode>>[];
    for (var value in ThemeMode.values) {
      items.add(
        DropdownMenuItem(
          value: value,
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(EnumToString.convertToString(value, camelCase: true)),
          ),
        ),
      );
    }
    return items;
  }
}
