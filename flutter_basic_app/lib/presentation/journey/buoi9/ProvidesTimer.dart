import 'package:flutter/foundation.dart';

class ProvidesTimer with ChangeNotifier, DiagnosticableTreeMixin {
  int hour = 10;
  int minute = 10;

  void timer(int hour, int minute) {
    this.hour = hour;
    this.minute = minute;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('hour', hour));
  }
}
