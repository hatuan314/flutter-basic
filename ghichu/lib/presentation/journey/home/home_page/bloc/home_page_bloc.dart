import 'dart:async';

import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_state.dart';
import 'package:ghichu/presentation/models/model_map.dart';

import '../home_page_constants.dart';

class HomePageBloc {
  HomePageState homePageState = HomePageState(
      keyMyList: ['Reminder'],
      leghtAll: 0,
      leghtToDay: 0,
      leghtSchedule: 0,
      buttonDelete: false,
      data: HomePageConstants.list,
      myListLeght: {'Reminder': 0});
  StreamController groupController =
      new StreamController<HomePageState>.broadcast();
  Stream get groupControllerStream => groupController.stream;
  void update() {
    homePageState.update();
    homePageState.setLeght();
    groupController.sink.add(homePageState);
  }

  void getKey() {
    homePageState.keyMyList = ModelListReminder.myList.keys.toList();
    groupController.sink.add(homePageState);
  }

  void dispose() {
    groupController.close();
  }
}
