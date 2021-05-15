import 'package:flutter/foundation.dart';
class ProviderListReminderPage with ChangeNotifier, DiagnosticableTreeMixin {
int indexCheck=0;
void setindexCheck(int index){
  indexCheck=index;
  notifyListeners();
}
}