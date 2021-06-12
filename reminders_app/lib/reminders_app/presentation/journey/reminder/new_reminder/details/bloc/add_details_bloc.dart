import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_details_event.dart';
import 'add_details_state.dart';

class AddDetailsBloc extends Bloc<AddDetailsEvent, AddDetailsState> {
  @override
  AddDetailsState get initialState =>
      AddDetailsState(date: 0,time: 0,priority: 0,hasTime: false,hasDate: false);

  @override
  Stream<AddDetailsState> mapEventToState(AddDetailsEvent event) async* {
    if (event is SetDateEvent) {
      yield* _mapSetDateEventToState(event);
    }
    if (event is SetTimeEvent) {
      yield* _mapSetTimeEventToState(event);
    }
    if (event is SetPriorityEvent) {
      yield* _mapSetPriorityEventToState(event);
    }
  }
  Stream<AddDetailsState> _mapSetDateEventToState(
      SetDateEvent event) async* {
   // log(event.activeAddButton.toString());
  //  final currentState = state;
    final int date = event.date;
    log(event.hasDate.toString());
    yield state.update(
      hasDate: event.hasDate,
      date: date,
    );
  }

  Stream<AddDetailsState> _mapSetTimeEventToState(
      SetTimeEvent event) async* {
    // log(event.activeAddButton.toString());
    //  final currentState = state;
    final int time = event.time;
    log("time"+event.hasTime.toString());
    yield state.update(
      hasTime: event.hasTime,
      time: time,
    );
  }
  Stream<AddDetailsState> _mapSetPriorityEventToState(
      SetPriorityEvent event) async* {
    // log(event.activeAddButton.toString());
    //  final currentState = state;
    final int priority = event.priority;
    yield state.update(
      priority: priority,
    );
  }
}
