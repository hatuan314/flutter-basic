import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/domain/entities/group_entity.dart';
import 'package:ghichu/domain/usecase/group_usecase.dart';

import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_event.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_state.dart';


class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final GroupUseCase groupUs;

  HomePageBloc({this.groupUs});
  @override
  // TODO: implement initialState
  HomePageState get initialState =>
      HomePageState(keyMyList: [], myListLeght: {'Reminder': 0});
  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    if (event is UpDate) {
      yield* _mapUpdataToState(event);
    }
    if (event is OrderGroup) {
      yield* _mapOrderGroup(event);
    }
  }

  Stream<HomePageState> _mapOrderGroup(OrderGroup orderGroup) async* {
    bool updateOrder = orderGroup.updateOrder;
    var item = state.keyMyList.removeAt(orderGroup.oldIndex);
    state.keyMyList.insert(orderGroup.newIndex, item);
    yield state.update(keyMyList: state.keyMyList, updateOrder: updateOrder);
    await groupUs.orderGroupLocal(orderGroup.oldIndex, orderGroup.newIndex);
  }

  Stream<HomePageState> _mapUpdataToState(UpDate upDate) async* {
    List<GroupEntity> listGroup = await groupUs.getUnitList();
    yield state.update(keyMyList: listGroup);
  }
}
