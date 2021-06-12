import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/presentation/journey/group/add_list/add_list_constaner.dart';

import 'add_list_event.dart';
import 'add_list_state.dart';

class AddListBloc extends Bloc<AddListEvent, AddListState> {
  @override
  AddListState get initialState => AddListState(
      color: AddListConstants.listColors[4], index: 4, activeAddBtn: false);

  @override
  Stream<AddListState> mapEventToState(AddListEvent event) async* {

    if (event is SelectColorEvent) {
      yield* _mapSelectColorEventToState(event);
    }
    if (event is ActiveAddBtn) {
      yield* _mapActiveAddBtn(event);
    }
  }

  Stream<AddListState> _mapActiveAddBtn(ActiveAddBtn event) async* {
    if (event.text.trim().isEmpty) {
      yield state.update(activeAddBtn: false);
    } else {
      yield state.update(activeAddBtn: true);
    }
  }

  Stream<AddListState> _mapSelectColorEventToState(
      SelectColorEvent event) async* {
    final Color selectColor = event.color;
    final int indexSelect = event.indexSelect;
    yield state.update(selectColor: selectColor, index: indexSelect);
  }
}
