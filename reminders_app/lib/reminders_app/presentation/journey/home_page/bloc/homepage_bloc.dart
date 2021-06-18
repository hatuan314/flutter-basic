import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_state.dart';
import 'homepage_event.dart';
import '../../reminders_list.dart';
import '../../../../../common/extensions/date_extensions.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState =>
      HomeState(todayListLength: 0, scheduledListLength: 0, allListLength: 0,myLists: RemindersList.MyLists);

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
     if(event is HomeEvent)
       yield* _mapUpdateEventToState(event);
  }

  Stream<HomeState> _mapUpdateEventToState(
      UpdateEvent event) async* {

   int todayListLength = 0;
   int scheduledListLength = 0;
   int allListLength = 0;
    if (RemindersList.allReminders?.length == null) {
      todayListLength = 0;
      scheduledListLength = 0;
      allListLength = 0;
    } else {
      RemindersList.allReminders?.forEach((key, value) {
        String now =  DateTime.now().dateDdMMyyyy;

        if (key == now) {
          todayListLength = RemindersList.allReminders[now].length;
        }
        if (key != ('Others')) {
          scheduledListLength += RemindersList.allReminders[key].length;
        }
        allListLength += RemindersList.allReminders[key].length;
      });
    }
    RemindersList.addDefaultList();
   yield state.update(
     myLists:null,
   );
    yield state.update(
      todayListLength: todayListLength,
      scheduledListLength: scheduledListLength,
      allListLength: allListLength,
      myLists: RemindersList.MyLists,
    );
   log('homeupdate');
  }

  
}
