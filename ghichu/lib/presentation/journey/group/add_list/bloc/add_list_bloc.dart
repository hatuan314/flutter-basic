import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/presentation/journey/group/add_list/add_list_constaner.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:ghichu/presentation/models/model_map.dart';

import 'add_list_event.dart';
import 'add_list_state.dart';

class AddListBloc extends Bloc<AddListEvent, AddListState> {
  @override
  AddListState get initialState => InitialAddListState(
      color: AddListConstants.listColors[4], index: 4, activeAddBtn: false);

  @override
  Stream<AddListState> mapEventToState(AddListEvent event) async* {

    if (event is SelectColorEvent) {
      yield* _mapSelectColorEventToState(event);
    }
    if (event is ActiveAddBtn) {
      yield* _mapActiveAddBtn(event);
    }
    if (event is CreateListEvent) {
      yield* _mapCreateListEventToState(event);
    }
  }

  Stream<AddListState> _mapActiveAddBtn(ActiveAddBtn event) async* {
    final currentState = state;
    if (currentState is InitialAddListState) {
      if (event.text.trim().isEmpty) {
        yield currentState.update(activeAddBtn: false);
      } else {
        yield currentState.update(activeAddBtn: true);
      }
    }
  }

  Stream<AddListState> _mapCreateListEventToState(CreateListEvent event) async* {
    ModelListReminder.reminderApp['groups'].add(Groups(
        name: event.name,
        color: event.color,
        createAt: DateTime.fromMillisecondsSinceEpoch(event.createAt).toString(),
        lastUpdate:
        DateTime.fromMillisecondsSinceEpoch(event.lastUpdate).toString())
        .toJson());
    yield SuccessAddListState(isCreate: true);
  }

  Stream<AddListState> _mapSelectColorEventToState(
      SelectColorEvent event) async* {
    final currentState = state;
    if (currentState is InitialAddListState) {
      final Color selectColor = event.color;
      final int indexSelect = event.indexSelect;
      yield currentState.update(selectColor: selectColor, index: indexSelect);
    }
  }
}
