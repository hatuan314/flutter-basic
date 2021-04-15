import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/todo_item.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/bottom_navigation_bar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/create_todo_item.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/personal_event.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>  _CalendarView();
}

class  _CalendarView extends State<CalendarView> {
  CalendarController _calendarController;
//  CreateTodoItem list = CreateTodoItem();

  List<TodoItem> TodoListForDay;
  DateTime focusedDay = DateTime.now();
  DateTime selectedDay ;
  int count=0;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    selectedDay=focusedDay;
  }
  void getTodoList()
  {

  }


  Widget build(BuildContext context) {
    final item = Provider.of<TodoItem>(context);
  //  TodoListForDay=context.read<TodoItem>().getTodoItemForDay(selectedDay);
    log(item.todoList.length.toString());
    return
          Container(
            //  margin: EdgeInsets.only(top: ScreenUtil().setHeight(50)),
              // color: Colors.redAccent,
              width: ScreenUtil().screenWidth,
              // height: ScreenUtil().screenWidth-20,
              child: SingleChildScrollView(
                child: TableCalendar(
                  // events: context.watch<TodoItem>().todoList,
                  availableGestures: AvailableGestures.horizontalSwipe,
                  initialCalendarFormat: CalendarFormat.month,
                  initialSelectedDay: DateTime.now(),
                  calendarController: _calendarController,
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  headerStyle: HeaderStyle(
                    centerHeaderTitle: true,
                    formatButtonVisible: false,
                  ),
                /*   onDaySelected: (selectedDay,todoList,TodoItemForDay)=>(
                   TodoListForDay=context.read<TodoItem>().getTodoItemForDay(selectedDay)
                   ),*/
                  calendarStyle: CalendarStyle(
                    canEventMarkersOverflow: true,
                    todayColor: Colors.blue,
                    selectedColor: Color.fromRGBO(13, 71, 161, 1),
                  ),
                ),
              )


    );
  }

}
