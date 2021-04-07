import 'package:flutter/foundation.dart';

class ProvidesTitleNode with ChangeNotifier, DiagnosticableTreeMixin {
  String title;
  String node;
  List Personal = [];
  void timer(String title, String node, String time) {
    this.title = title;
    this.node = node;
    if (title != '' && node != '') {
      Personal.add({'time': time, 'title': title, 'node': node});
    }
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
  }
}
