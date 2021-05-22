import 'dart:async';

import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/details_screen.dart';

class DetailsBloc {
  DetailsState detailsState = DetailsState(
      date: false,
      time: false,
      tableCalender: false,
      timePicker: false,
      dateTime: DateTime.now(),
      nowTime: DateTime.now(),
      timeDate: 'Hôm Nay',
      thu: '',
      hour: DateTime.now().hour,
      minuner: DateTime.now().minute);
  StreamController _detailsController =
      new StreamController<DetailsState>.broadcast();
  Stream get detailsController => _detailsController.stream;

  void tableCanlender() {
    detailsState.tableCanLender();
    _detailsController.sink.add(detailsState);
  }

  void tableTimePicker() {
    detailsState.tableTimePicker();
    _detailsController.sink.add(detailsState);
  }

  void setDate(DateTime dateTime) {
    detailsState.dateScheldul(dateTime);
    _detailsController.sink.add(detailsState);
  }

  void setTimeHour(int hour, int minute) {
    detailsState.timeHour(hour, minute);
    _detailsController.sink.add(detailsState);
  }

  void setTimeSwitch(bool time) {
    detailsState.timeSwitch(time);
    _detailsController.sink.add(detailsState);
  }

  void setDateSwitch(bool date) {
    detailsState.dateSwitch(date);
    _detailsController.sink.add(detailsState);
  }
void update(){
    _detailsController.sink.add(detailsState);
}
  void dispose() {
    _detailsController.close();
  }
}
