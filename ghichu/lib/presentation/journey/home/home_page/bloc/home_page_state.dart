import 'package:equatable/equatable.dart';
import 'package:ghichu/domain/entities/group_entity.dart';


// ignore: must_be_immutable
class HomePageState extends Equatable {
  List<GroupEntity> keyMyList = [];
  bool updateOrder;
  Map<String, int> myListLeght;
  HomePageState({this.keyMyList, this.updateOrder, this.myListLeght});
  HomePageState update(
          {List<GroupEntity> keyMyList,
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
