import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCounter with ChangeNotifier,DiagnosticableTreeMixin
{
    int count=0;
    void increment()
    {
      count++;
      notifyListeners();
    }
    void notchange()
    {
      count=0;
      notifyListeners();
    }
    void decrement()
    {
      count--;
      notifyListeners();
    }
    @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}