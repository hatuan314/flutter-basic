import 'package:equatable/equatable.dart';
import 'package:ghichu/presentation/models/group.dart';

// ignore: must_be_immutable
class HomePageState extends Equatable {
  List<Groups> keyMyList = [];
  bool updateOrder;
  Map<String, int> myListLeght;
  HomePageState({this.keyMyList, this.updateOrder, this.myListLeght});
  HomePageState update(
          {List<Groups> keyMyList,
          bool updateOrder,
          Map<String, int> myListLeght}) =>
      HomePageState(
          keyMyList: keyMyList ?? this.keyMyList,
          updateOrder: updateOrder ?? this.updateOrder,
          myListLeght: myListLeght ?? this.myListLeght);
  @override
  // TODO: implement props
  List<Object> get props =>
      [this.keyMyList, this.updateOrder, this.myListLeght];
}
