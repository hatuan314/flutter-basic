import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SelectedDay with ChangeNotifier,DiagnosticableTreeMixin{
  DateTime date=DateTime.now();
  void setDate(DateTime value)
  {
    date=value;
    log(date.toString());
    notifyListeners();
  }
}
