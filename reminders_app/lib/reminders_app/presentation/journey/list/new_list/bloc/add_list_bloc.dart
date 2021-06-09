import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/add_list_event.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/add_list_state.dart';

class AddListBloc extends Bloc<AddListEvent, AddListState> {
  @override
  AddListState get initialState =>
      AddListState(selectColor: Colors.red);

  @override
  Stream<AddListState> mapEventToState(AddListEvent event) async* {
    if (event is SelectColorEvent) {
      yield* _mapSelectColorEventToState(event);
    }
  }

  Stream<AddListState> _mapSelectColorEventToState(
      SelectColorEvent event) async* {
    log('Select');
    final currentState = state;
    final Color selectColor = event.color;
    yield state.update(
      selectColor: selectColor,
    );
  }
}
