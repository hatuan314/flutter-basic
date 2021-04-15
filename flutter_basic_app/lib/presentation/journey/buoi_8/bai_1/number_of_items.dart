import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemCounter with ChangeNotifier,DiagnosticableTreeMixin
{
    int count=0;
    double price= 26.5;
    void increment()
    {
      count++;
      price=26.5*count;
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
      price=26.5*count;
      notifyListeners();
    }
    @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}