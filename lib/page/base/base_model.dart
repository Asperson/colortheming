import 'package:flutter/widgets.dart';

import 'package:colortheming/common/enums.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void notify() {
    if (hasListeners) {
      notifyListeners();
    }
  }
}
