import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TodoItem with ChangeNotifier,DiagnosticableTreeMixin{
  String title;
  DateTime date ;
  String note;
  String time;
// TodoItem();

  TodoItem(String title, String note, TimeOfDay time, DateTime date);

  List<dynamic> todoList=[];

  void addItem(String intitle, String innote, TimeOfDay intime, DateTime indate)
  {
    log(time.toString());
    log(date.toString());
   // time=intime.hour.toString()+':'+intime.minute.toString();
    if (title !=null && note !=null) {
      todoList.add({'date':date,'time': time, 'title': title, 'note': note});
      log('add thanh cong');
    }
    log(todoList.length.toString());
    notifyListeners();
  }

  List<TodoItem> getTodoItemForDay(DateTime selectedDay) {
    List<TodoItem> TodoListForDay=[];
      for (int i = 0; i <= todoList.length; i++) {
        if (todoList[i].date == selectedDay) {
          TodoListForDay.add(todoList[i]);
        }
        return TodoListForDay;
      }
    notifyListeners();
    //  return TodoListForDay;
  }
  void setDate(DateTime value)
  {
    date=value;
    log(date.toString());
    notifyListeners();
  }

  void setTitle(String value)
  {
      title=value;
      log(title);
      notifyListeners();
  }
  void setNote(String value)
  {
    note=value;
    log(note);
    notifyListeners();
  }
  void setTime(TimeOfDay timeOfDay)
  {
    time=timeOfDay.hour.toString()+':'+timeOfDay.minute.toString();
    log(time);
    notifyListeners();
  }
  
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    
  }


}