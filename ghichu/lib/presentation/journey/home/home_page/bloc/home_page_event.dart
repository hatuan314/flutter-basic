import 'package:ghichu/domain/entities/group_entity.dart';

abstract class HomePageEvent {}

class UpDate extends HomePageEvent {}

class OrderGroup extends HomePageEvent {
  final int oldIndex;
  final int newIndex;
  final bool updateOrder;
  OrderGroup({this.updateOrder, this.newIndex, this.oldIndex});
}

class OrderGroupSystem extends HomePageEvent {
  final int oldIndex;
  final int newIndex;
  final bool updateOrder;
  OrderGroupSystem({this.updateOrder, this.newIndex, this.oldIndex});
}

class EditEvent extends HomePageEvent {
  final bool isEdit;

  EditEvent({this.isEdit});
}
