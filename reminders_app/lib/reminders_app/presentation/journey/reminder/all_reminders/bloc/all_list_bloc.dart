import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';
import 'all_list_event.dart';

import '../../../reminders_list.dart';

import 'all_list_state.dart';

class AllReminderBloc extends Bloc<AllReminderEvent, AllReminderState> {
  @override
  AllReminderState get initialState => AllReminderState( myLists: RemindersList.MyLists);

  @override
  Stream<AllReminderState> mapEventToState(AllReminderEvent event) async* {
    if (event is UpdateEvent) {
      yield* _mapUpdateEventToState(event);
    }
   
  }

  Stream<AllReminderState> _mapUpdateEventToState(
      UpdateEvent event) async* {
    log("all list update");
    final List<Group> list = RemindersList.MyLists;
    yield state.update(myLists: null);
     yield state.update(myLists: list);
    //log(state.myLists.length.toString());
  }

 
}
