import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/domain/entities/group_entity.dart';
import 'package:ghichu/domain/entities/reminder_entity.dart';
import 'package:ghichu/domain/usecase/group_usecase.dart';
import 'package:ghichu/domain/usecase/reminder_usecase.dart';

import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_event.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GroupUseCase groupUs;
  final ReminderUseCase reminderUs;
  HomePageBloc({this.groupUs, this.reminderUs});
  @override
  // TODO: implement initialState
  HomePageState get initialState => HomePageState(
      keyMyList: [],
      isEdit: true,
      reminderSystem: ['Today', 'Scheduled', 'All']);
  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is UpDate) {
      yield* _mapUpdataGroupToState(event);
    }
    if (event is OrderGroup) {
      yield* _mapOrderGroup(event);
    }
    if(event is OrderGroupSystem){
      log('234');
    }
    if (event is EditEvent) {
      yield* _mapEditToState(event);
    }
  }

  Stream<HomePageState> _mapEditToState(EditEvent event) async* {
    bool isEdit = !event.isEdit;
    yield state.update(isEdit: isEdit);
  }

  Stream<HomePageState> _mapOrderGroup(OrderGroup orderGroup) async* {
    bool updateOrder = orderGroup.updateOrder;
    var item = state.keyMyList.removeAt(orderGroup.oldIndex);
    state.keyMyList.insert(orderGroup.newIndex, item);
    yield state.update(keyMyList: state.keyMyList, updateOrder: updateOrder);
    await groupUs.orderGroupLocal(state.keyMyList);
  }

  Stream<HomePageState> _mapUpdataGroupToState(UpDate upDate) async* {
    List<GroupEntity> listGroup = await groupUs.getUnitList();
    Map<String, List<ReminderEntity>> listReminder =
        await reminderUs.getReminderToGroup(listGroup);
    yield state.update(keyMyList: listGroup, remindertoGroup: listReminder);
  }
}
