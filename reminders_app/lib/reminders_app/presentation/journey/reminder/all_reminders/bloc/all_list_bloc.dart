import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';
import 'all_list_event.dart';

import '../../../reminders_list.dart';

import 'all_list_state.dart';

class AllRemindersBloc extends Bloc<AllRemindersEvent, AllRemindersState> {
  @override
  AllRemindersState get initialState => AllRemindersState( myLists: RemindersList.MyLists);

  @override
  Stream<AllRemindersState> mapEventToState(AllRemindersEvent event) async* {
    if (event is UpdateAllListEvent) {
      yield* _mapUpdateEventToState(event);
    }
   
  }

  Stream<AllRemindersState> _mapUpdateEventToState(
      UpdateAllListEvent event) async* {
    log("all list update");
    final List<Group> list = RemindersList.MyLists;
    yield state.update(myLists: null);
     yield state.update(myLists: list);
    //log(state.myLists.length.toString());
  }

 
}
