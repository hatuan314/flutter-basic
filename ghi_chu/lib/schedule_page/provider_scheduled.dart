import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ghi_chu/model/model_map.dart';

class ProviderSchedule with ChangeNotifier, DiagnosticableTreeMixin {
  String key = '1232';
  List<String> key1 = [];
  int getKey() {
    ModelListReminder.listReminder.forEach((key, value) {
      value.forEach((key, value) {
        if (key != 'orther') {
          if (key1.length == 0) {
            key1.add(key);
          } else if (key1[key1.length - 1] != key) {
            key1.add(key);
          }
        }
      });
    });

    notifyListeners();
    return key1.length;
  }
}
