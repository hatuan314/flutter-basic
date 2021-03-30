
import 'package:flutter/foundation.dart';

class ProvidesCount with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void cong() {
    _count++;
    notifyListeners();
  }
  void tru(){
    _count--;
    notifyListeners();
  }
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}