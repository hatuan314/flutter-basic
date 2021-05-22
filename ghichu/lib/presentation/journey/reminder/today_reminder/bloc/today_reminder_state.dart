import 'package:ghichu/presentation/models/model_map.dart';
import 'package:intl/intl.dart';

class TodayReminderState {
  String nowDate;

  TodayReminderState({this.nowDate});

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
