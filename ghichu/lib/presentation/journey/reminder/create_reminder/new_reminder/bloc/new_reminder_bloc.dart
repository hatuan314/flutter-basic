import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_event.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';

class NewReminderBloc extends Bloc<NewReminderEvent, NewReminderState> {
  @override
  NewReminderState get initialState => InitialNewReminderState(
      isDateDetails: false,
      activeBtn: false,
      nameGroup: '',
      colorsGroup: Colors.blue);

  @override
  Stream<NewReminderState> mapEventToState(NewReminderEvent event) async* {
    if (event is UpDateNewReminderEvent) {
      yield* _mapUpDateToState(event);
    }
    if (event is ActiveBtn) {
      yield* _mapActiveBtn(event);
    }

    if (event is PushDetailEvent) {
      InitialNewReminderState current;
      if (state is InitialNewReminderState) {
        current = state;
      }
      yield PushToDetailState();
      yield current;
    }
    if (event is PushListGroupEvent) {
      InitialNewReminderState current;
      if (state is InitialNewReminderState) {
        current = state;
      }
      yield PushToListGroupState();
      yield current;
    }
  }

  Stream<NewReminderState> _mapUpDateToState(
      UpDateNewReminderEvent event) async* {
    final current = state;
    if (current is InitialNewReminderState) {
      yield current.update(
        colorsGroup: event.colorGroup,
        nameGroup: event.nameGroup,
      );
    }
  }

  Stream<NewReminderState> _mapActiveBtn(ActiveBtn event) async* {
    final currentState = state;
    if (currentState is InitialNewReminderState)
      yield currentState.update(activeBtn: event.activeBtn);
  }
}
