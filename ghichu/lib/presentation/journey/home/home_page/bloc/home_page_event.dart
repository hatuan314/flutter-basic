
import 'package:ghichu/presentation/models/group.dart';
abstract class HomePageEvent {}

class UpDate extends HomePageEvent {}

class OrderGroup extends HomePageEvent {
  final List<Groups> listGroup;
  final bool updateOrder;
  OrderGroup({this.listGroup,this.updateOrder});
}
