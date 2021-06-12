import 'package:equatable/equatable.dart';

class NewReminderState extends Equatable {
  final bool isDateDetails;
  final bool activeBtn;

  NewReminderState({this.isDateDetails, this.activeBtn});
  NewReminderState update({bool isDateDetails, bool activeBtn}) =>
      NewReminderState(
          isDateDetails: isDateDetails ?? this.isDateDetails,
          activeBtn: activeBtn ?? this.activeBtn);

  @override
  // TODO: implement props
  List<Object> get props => [this.activeBtn, this.isDateDetails];
}
// class NewReminderState extends Equatable {
//   final bool activeBtn;
//   final bool isDateDetails;
//   final Groups groups;
//   NewReminderState({this.activeBtn, this.isDateDetails, this.groups});
//   NewReminderState update({bool activeBtn, bool isDateDetails, bool groups}) =>
//       NewReminderState(
//           activeBtn: activeBtn ?? this.activeBtn,
//           isDateDetails: isDateDetails ?? this.isDateDetails,
//           groups: groups ?? this.groups);
//   @override
//   // TODO: implement props
//   List<Object> get props => [this.activeBtn, this.groups, this.isDateDetails];
// }

// String title = '';
// String note = '';
// String group = 'Reminder';
// int index = 0;
// int valuesTime;
// DateTime nowDate = DateTime.now();
// bool button = false;
// bool isButtonDetails = false;
// bool isTimeDetails = false;
//
// NewReminderState(
//     {this.title,
//       this.note,
//       this.group,
//       this.index,
//       this.valuesTime,
//       this.nowDate,
//       this.button,
//       this.isButtonDetails,
//       this.isTimeDetails});
//
// void setGroup(String title, int index) {
//   this.index = index;
//   group = title;
// }
//
// void bottonAdd(String title) {
//   if (title.trim().isNotEmpty) {
//     button = true;
//   } else {
//     button = false;
//   }
// }
//
// void setTime(var values) {
//   if (values == null) {
//     valuesTime = null;
//     isButtonDetails = false;
//     isTimeDetails = false;
//   } else {
//     isButtonDetails = true;
//     isTimeDetails = values[1];
//     valuesTime = values[0];
//   }
// }
//
// void setValues(String title, String node) {
//   this.title = title;
//   this.note = note;
// }
//
// void addTodoList(String title, String note, int date, String group,
//     String priority, int createAt, int lastUpdate, bool time) {
//   String keyDate;
//   if (date != null) {
//     keyDate = DateFormat('yyyy-MM-dd')
//         .format(DateTime.fromMillisecondsSinceEpoch(date));
//   } else {
//     keyDate = 'orther';
//   }
//   if (ModelListReminder.listReminder['$group'].containsKey(keyDate)) {
//     ModelListReminder.listReminder['$group']['$keyDate'].add(Reminder(
//         title,
//         note,
//         group,
//         priority,
//         date,
//         createAt,
//         DateTime.now().millisecondsSinceEpoch,
//         time));
//   } else {
//     ModelListReminder.listReminder['$group'].addAll({
//       keyDate: [
//         Reminder(title, note, group, priority, date, createAt,
//             DateTime.now().millisecondsSinceEpoch, time)
//       ].toList()
//     });
//   }
// }
