import 'package:flutter/cupertino.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';


abstract class AllReminderEvent{

}

class UpdateEvent extends AllReminderEvent{
  final List<Group> myLists ;

  UpdateEvent({@required this.myLists});
}

 