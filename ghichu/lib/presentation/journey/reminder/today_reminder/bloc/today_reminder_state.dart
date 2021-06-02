import 'package:ghichu/presentation/models/model_map.dart';
import 'package:intl/intl.dart';

class TodayReminderState {
  String nowDate;
  int indexReminder, indexGroup,indexGroupReminder;
  TodayReminderState({this.nowDate});
void setIndexReminder(int index){
  indexReminder=index;
}
  int getToday() {
    int a = 0;
    ModelListReminder.listReminder.forEach((key, value) {
      try {
        value[nowDate].forEach((element) {
          a = a + 1;
        });
      } catch (_) {}
    });
    return a;
  }
}
