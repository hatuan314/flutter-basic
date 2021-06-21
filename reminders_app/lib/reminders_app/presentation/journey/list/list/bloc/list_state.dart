import 'package:equatable/equatable.dart';
import 'package:reminders_app/reminders_app/domain/entities/reminder.dart';

class ListState extends Equatable{
  List<Reminder> list=[];

  ListState({this.list});
ListState update({List<Reminder> list})=> ListState(list: list);
  @override
  List<Object> get props => this.list;
}