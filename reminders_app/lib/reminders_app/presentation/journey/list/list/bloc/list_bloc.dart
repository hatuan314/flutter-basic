import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';
import 'package:reminders_app/reminders_app/domain/entities/reminder.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/list/bloc/list_event.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/list/bloc/list_state.dart';
import '../../../reminders_list.dart';


class ListBloc extends Bloc<ListEvent, ListState> {
  @override
  ListState get initialState => ListState( list: []);

  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    if (event is UpdateListEvent) {
      yield* _mapUpdateEventToState(event);
    }

  }

  Stream<ListState> _mapUpdateEventToState(
      UpdateListEvent event) async* {
    log("  list update");
    final List<Reminder> list = RemindersList.MyLists[event.index].list;;
    yield state.update(list: null);
    yield state.update(list: list);
    //log(state.myLists.length.toString());
  }


}
