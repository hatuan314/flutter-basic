import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/bloc/new_reminder_event.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/bloc/reminder_state.dart';

class NewReminderBloc extends Bloc<NewReminderEvent, NewReminderState> {
  @override
  NewReminderState get initialState => NewReminderState(list: 'Reminders');

  @override
  Stream<NewReminderState> mapEventToState(NewReminderEvent event) async* {
    if (event is SetTitleEvent) {
      yield* _mapSetTitleEventToState(event);
    }
    if (event is SetNotesEvent) {
      yield* _mapSetNotesEventToState(event);
    }
    if (event is SetListEvent) {
      yield* _mapSetListEventToState(event);
    }
    if (event is SetDetailsEvent) {
      yield* _mapSetDetailsEventToState(event);
    }
  }

  Stream<NewReminderState> _mapSetTitleEventToState(
      SetTitleEvent event) async* {
    final String title = event.title;
    yield state.update(title: title);
  }

  Stream<NewReminderState> _mapSetNotesEventToState(
      SetNotesEvent event) async* {
    final String notes = event.notes;
    yield state.update(notes: notes);
  }

  Stream<NewReminderState> _mapSetListEventToState(SetListEvent event) async* {
    final String list = event.list;
    yield state.update(list: list);
  }

  Stream<NewReminderState> _mapSetDetailsEventToState(
      SetDetailsEvent event) async* {
    yield state.update(details: event.details);
  }
}
