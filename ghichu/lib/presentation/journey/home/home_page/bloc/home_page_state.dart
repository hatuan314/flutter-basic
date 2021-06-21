import 'package:equatable/equatable.dart';
import 'package:ghichu/domain/entities/group_entity.dart';
import 'package:ghichu/domain/entities/reminder_entity.dart';

// ignore: must_be_immutable
class HomePageState extends Equatable {
  List<GroupEntity> keyMyList = [];
  bool updateOrder;
  bool isEdit;
  List<String> reminderSystem = [];
  Map<String, List<ReminderEntity>> remindertoGroup;
  HomePageState(
      {this.keyMyList,
      this.updateOrder,
      this.remindertoGroup,
      this.isEdit,
      this.reminderSystem});
  HomePageState update(
          {List<GroupEntity> keyMyList,
          List<String> reminderSystem,
          bool updateOrder,
          bool isEdit,
          Map<String, List<ReminderEntity>> remindertoGroup}) =>
      HomePageState(
          reminderSystem: reminderSystem ?? this.reminderSystem,
          isEdit: isEdit ?? this.isEdit,
          keyMyList: keyMyList ?? this.keyMyList,
          updateOrder: updateOrder ?? this.updateOrder,
          remindertoGroup: remindertoGroup ?? this.remindertoGroup);
  @override
  // TODO: implement props
  List<Object> get props => [
        this.isEdit,
        this.keyMyList,
        this.updateOrder,
        this.remindertoGroup,
        this.reminderSystem
      ];
}
