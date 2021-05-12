import 'package:flutter/foundation.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:intl/intl.dart';

class ProviderToday with ChangeNotifier, DiagnosticableTreeMixin {
  String nowDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  int getToday() {
    int a = 0;
    ModelListReminder.listReminder.forEach((key, value) {
      try {
        value[nowDate].forEach((element) {
          a = a + 1;
        });
      } catch (_) {}
    });

    notifyListeners();
    return a;
  }
}
