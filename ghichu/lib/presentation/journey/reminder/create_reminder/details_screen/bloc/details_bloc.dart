import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_event.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  @override
  // TODO: implement initialState
  DetailsState get initialState => InitDetailsState(
      isDateSwitch: false,
      isTimeSwitch: false,
      isDateTableCanlender: false,
      isTimeTable: false,
      selectDate: DateTime.now(),
      timeOfDay: TimeOfDay.now());

  @override
  Stream<DetailsState> mapEventToState(DetailsEvent event) async* {
    if (event is DateSwitchEvent) {
      yield* _mapDateSwitchToState(event);
    }
    if (event is TimeSwitchEvent) {
      yield* _mapTimeSwitchToState(event);
    }
    if (event is IsShowDateTableCanlenderEvent) {
      yield* _mapIsShowDateTableToState(event);
    }
    if (event is IsShowTimeTableEvent) {
      yield* _mapIsShowTimeTableToState(event);
    }
    if (event is SelectDate) {
      yield* _mapSelectDateToState(event);
    }
    if (event is SelectTime) {
      yield* _mapSelectTimeToState(event);
    }
    if (event is PushPrioritiesEvent) {
      yield* _mapPushPrioritiesToState(event);
    }
  }

  Stream<DetailsState> _mapPushPrioritiesToState(
      PushPrioritiesEvent event) async* {
    yield PushPrioritiesState();
    yield InitDetailsState(
        isDateSwitch: false,
        isTimeSwitch: false,
        isDateTableCanlender: false,
        isTimeTable: false,
        selectDate: DateTime.now(),
        timeOfDay: TimeOfDay.now());
  }

  Stream<DetailsState> _mapSelectTimeToState(SelectTime event) async* {
    final current = state;
    if (current is InitDetailsState) {
      yield current.update(timeOfDay: event.timeOfDay);
    }
  }

  Stream<DetailsState> _mapSelectDateToState(SelectDate event) async* {
    final current = state;
    if (current is InitDetailsState) {
      yield current.update(selectDate: event.selectDate);
    }
  }

  Stream<DetailsState> _mapIsShowTimeTableToState(
      IsShowTimeTableEvent event) async* {
    final currentState = state;
    if (currentState is InitDetailsState) {
      bool isShowTimeTable;
      if (currentState.isTimeSwitch) {
        isShowTimeTable = !event.isShowTimeTable;
        yield currentState.update(isTimeTable: isShowTimeTable);
      }
    }
  }

  Stream<DetailsState> _mapIsShowDateTableToState(
      IsShowDateTableCanlenderEvent event) async* {
    final currentState = state;
    if (currentState is InitDetailsState) {
      bool isDateTableCanlender;
      if (currentState.isDateSwitch) {
        isDateTableCanlender = !event.isShowDateTableCanlender;
        yield currentState.update(isDateTableCanlender: isDateTableCanlender);
      }
    }
  }

  Stream<DetailsState> _mapDateSwitchToState(DateSwitchEvent event) async* {
    final currentState = state;
    if (currentState is InitDetailsState) {
      bool isTimeSwitch, isDateTableCanlender, isTimeTable;
      if (event.isDateSwitch == false) {
        isTimeSwitch = false;
        isDateTableCanlender = false;
        isTimeTable = false;
      } else {
        isDateTableCanlender = true;
      }
      yield currentState.update(
          isDateSwitch: event.isDateSwitch,
          isTimeSwitch: isTimeSwitch,
          isTimeTable: isTimeTable,
          isDateTableCanlender: isDateTableCanlender,
          selectDate: DateTime.now());
    }
  }

  Stream<DetailsState> _mapTimeSwitchToState(TimeSwitchEvent event) async* {
    final currentState = state;
    if (currentState is InitDetailsState) {
      bool isDateSwitch, isTimeTable;
      if (event.isTimeSwitch) {
        isDateSwitch = true;
        isTimeTable = true;
      } else {
        isTimeTable = false;
      }
      yield currentState.update(
          isTimeSwitch: event.isTimeSwitch,
          isDateSwitch: isDateSwitch,
          isTimeTable: isTimeTable);
    }
  }
}
