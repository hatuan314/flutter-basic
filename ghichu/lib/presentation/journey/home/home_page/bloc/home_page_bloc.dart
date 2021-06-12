import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/data/data_group_respositories_req.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_event.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_state.dart';
import 'package:ghichu/presentation/models/group.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
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
    List<Groups> listGroupOrder = orderGroup.listGroup;
    bool updateOrder=orderGroup.updateOrder;
    DataGroupRespositoriesReq().orderGroup(listGroupOrder);
    yield state.update(keyMyList: listGroupOrder,updateOrder: updateOrder);
  }
  Stream<HomePageState> _mapUpdataToState(UpDate upDate) async* {
    List<Groups> listGroup = await DataGroupRespositoriesReq().fetchGroup();
    yield state.update(keyMyList: listGroup);
  }
}
