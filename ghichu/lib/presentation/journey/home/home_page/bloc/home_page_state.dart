import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/today_reminder/bloc/today_reminder_state.dart';
import 'package:ghichu/presentation/models/model_map.dart';
import 'package:intl/intl.dart';
class HomePageState {
  List<String> keyMyList = [];
  int leghtAll ;
  int leghtToDay ;
  int leghtSchedule ;
  int index;
  bool buttonDelete = false;
  var data = HomePageConstants.list;
  Map<String, int> myListLeght ;
  HomePageState(
      {this.keyMyList,
      this.leghtAll,
      this.leghtToDay,
      this.leghtSchedule,
      this.index,
      this.buttonDelete,
      this.data,
      this.myListLeght});

  void update() {
    setLeght();
    for (int i = 0; i < HomePageConstants.list.length; i++) {
      if (HomePageConstants.list[i]['title'] == 'Today') {
        HomePageConstants.list[i]['sum'] = TodayReminderState(nowDate:  DateFormat('yyyy-MM-dd').format(DateTime.now())).getToday();
      } else if (HomePageConstants.list[i]['title'] == 'Scheduled') {
        HomePageConstants.list[i]['sum'] = ScheduleReminderState(reminderSchedule: {}).getReminder();
      } else if (HomePageConstants.list[i]['title'] == 'All') {
        HomePageConstants.list[i]['sum'] = leghtAll;
      }
    }
  }

  void setButtonDelete(int index) {
    this.index = index;
  }

  void addList() {
    keyMyList.add(ModelListReminder.myList.keys
        .elementAt(ModelListReminder.myList.length - 1));
  }

  void setLeght() {
    int all = 0;
    int leght = 0;
    ModelListReminder.listReminder.forEach((key, value) {
      value.forEach((key, value) {
        all = all + value.length;
        leght = leght + value.length;
      });
      if (key == "Reminder") {
        myListLeght['Reminder'] = leght;
      } else {
        myListLeght.addAll({key: leght});
      }
      leght = 0;
    });
    leghtAll = all;
  }
}
