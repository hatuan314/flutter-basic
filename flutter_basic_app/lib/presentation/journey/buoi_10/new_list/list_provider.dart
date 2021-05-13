import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewListProvider with  ChangeNotifier,DiagnosticableTreeMixin{
  Color listColor=Colors.blue;
  String name;
  void setColor(Color value)
  {
    listColor=value;
    notifyListeners();
  }
  void setName(String value)
  {
    name=value;
    notifyListeners();
  }
}