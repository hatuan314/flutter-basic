import 'dart:async';

import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/bloc/list_group_state.dart';

class ListGroupBloc {
  ListGroupState listGroupState = ListGroupState(indexCheck: 0);
  StreamController _selectIndex =
      new StreamController<ListGroupState>.broadcast();

  Stream get selectIndex => _selectIndex.stream;

  void setIndex(int index) {
    listGroupState.setindexCheck(index);
    _selectIndex.sink.add(listGroupState);
  }

  void dispose() {
    _selectIndex.close();
  }
}
