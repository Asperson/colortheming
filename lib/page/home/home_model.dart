import 'package:colortheming/common/enums.dart';
import 'package:colortheming/page/base/base_model.dart';
import 'package:colortheming/service/settings_service.dart';

class HomeModel extends BaseModel {
  // Services
  final SettingsService _settingsService;

  // Data
  late int counter;

  HomeModel(this._settingsService);

  Future fetchData() async {
    counter = 0;
    setState(ViewState.idle);
  }

  incrementCounter() {
    counter++;
    setState(ViewState.idle);
  }
}
