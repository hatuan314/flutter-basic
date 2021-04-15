import 'dart:developer';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/todo_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateTodoItem extends StatelessWidget {
 //final textTitle= TextEditingController();
// final textNote= TextEditingController();
  DateTime selectedDay=DateTime.now();
  String title ;
  String note;
  TimeOfDay time=TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<TodoItem>(context);
   // item.date=DateTime.now();
   // item.time=TimeOfDay.now().hour.toString()+":"+TimeOfDay.now().minute.toString();
    //item.setDate(selectDay.selected);
    return
      Container(
        height: ScreenUtil().screenHeight*2/3,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        // color: Colors.indigo,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(30),
            left: ScreenUtil().setWidth(25),
            right: ScreenUtil().setWidth(25),
            top: ScreenUtil().setHeight(30),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children: [
              Padding(
                  padding:
                      EdgeInsets.only(bottom: (ScreenUtil().setHeight(25))),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setHeight(20),
                        right: ScreenUtil().setHeight(20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              Color.fromRGBO(13, 71, 161, 1).withOpacity(0.8),
                          width: ScreenUtil().setSp(2),
                        )),
                    child: TextField(
                     // controller: textTitle,
                      maxLines: 1,
                      textCapitalization: TextCapitalization.sentences,
                      textAlign: TextAlign.start,
                      onChanged: (value) =>
                          {context.read<TodoItem>().setTitle(value),
                            title=value,
                            log(title),
                          },
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          fontFamily: 'MS',
                          fontWeight: FontWeight.w600,
                          color:
                              Color.fromRGBO(13, 71, 161, 1).withOpacity(0.7),
                        ),
                        // enabled: false,
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              Padding(
                  padding:
                      EdgeInsets.only(bottom: (ScreenUtil().setHeight(20))),
                  child: Container(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setHeight(20),
                        right: ScreenUtil().setHeight(20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color:
                              Color.fromRGBO(13, 71, 161, 1).withOpacity(0.8),
                          width: ScreenUtil().setSp(2),
                        )),
                    child: TextField(
                      //controller: textNote,
                      maxLines: 6,
                      textCapitalization: TextCapitalization.sentences,
                      textAlign: TextAlign.start,
                      onChanged: (value) =>
                      {context.read<TodoItem>().setNote(value),
                        note=value,
                        log(note),
                      },
                      decoration: InputDecoration(
                        labelText: 'Note',
                        labelStyle: TextStyle(
                          fontSize: ScreenUtil().setSp(18),
                          fontFamily: 'MS',
                          fontWeight: FontWeight.w600,
                          color:
                              Color.fromRGBO(13, 71, 161, 1).withOpacity(0.7),
                        ),
                        // enabled: false,
                        border: InputBorder.none,
                      ),
                    ),
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: (ScreenUtil().setHeight(15))),
                child: Text(
                  'Set time',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(25),
                    fontFamily: 'MS',
                    fontWeight: FontWeight.w700,
                    color: Color.fromRGBO(13, 71, 161, 1),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: (ScreenUtil().setHeight(20))),
                child:GestureDetector(
                  onTap: () {
                    // log(item.time.toString());
                    selectTime(context );
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        left: ScreenUtil().setHeight(20),
                        right: ScreenUtil().setHeight(20)),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromRGBO(13, 71, 161, 1).withOpacity(0.8),
                          width: ScreenUtil().setSp(2),
                        )),
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(13),
                        bottom: ScreenUtil().setHeight(13),
                      ),
                      child: Text(
                        // '${context.watch<TodoItem>().time.hour}:${context.watch<TodoItem>().time.minute}',
                        '${context.watch<TodoItem>().time}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            fontFamily: 'MS',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(13, 71, 161, 1).withOpacity(0.8)),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                child: saveButton(context),
              ),
            ],
          ),
        ),

      ) ;
  }


 void selectTime(BuildContext context ) async {
   // final item = Provider.of<TodoItem>(context,listen: true);
   final TimeOfDay newTime = await showTimePicker(
     context: context,
     initialTime: time,
   );
   if (newTime != null) {
     context.read<TodoItem>().setTime(newTime);
     time=newTime;
    // log(item.time.toString());
   }
 }

  Widget pickTime(context) {
   final item = Provider.of<TodoItem>(context);
 //  item.time=TimeOfDay.now().hour.toString()+":"+TimeOfDay.now().minute.toString();
    return GestureDetector(
      onTap: () {
       // log(item.time.toString());
        selectTime(context );
      },
      child: Container(
        padding: EdgeInsets.only(
            left: ScreenUtil().setHeight(20),
            right: ScreenUtil().setHeight(20)),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Color.fromRGBO(13, 71, 161, 1).withOpacity(0.8),
              width: ScreenUtil().setSp(2),
            )),
        child: Padding(
          padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(13),
            bottom: ScreenUtil().setHeight(13),
          ),
          child: Text(
           // '${context.watch<TodoItem>().time.hour}:${context.watch<TodoItem>().time.minute}',
            '${item.time}',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(20),
                fontFamily: 'MS',
                fontWeight: FontWeight.w700,
                color: Color.fromRGBO(13, 71, 161, 1).withOpacity(0.8)),
          ),
        ),
      ),
    );
  }

  Widget saveButton(BuildContext context) {
    //log(todoList.length.toString());
   // final item = Provider.of<TodoList>(context);
    return GestureDetector(
      onTap: () =>
      {
        //log(title.text+"!!!!!!!!!!!!!!!11"),
        context.read<TodoItem>().addItem(title,note, time, selectedDay),
      },
      child: Container(
        padding: EdgeInsets.only(
            top: ScreenUtil().setHeight(15),
            bottom: ScreenUtil().setHeight(15),
            left: ScreenUtil().setHeight(20),
            right: ScreenUtil().setHeight(20)),
        decoration: BoxDecoration(
            color: Color.fromRGBO(13, 71, 161, 1),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(0, 2))
            ]),
        child: Text(
          'Save',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            fontFamily: 'MS',
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    final item = Provider.of<TodoItem>(context);
   // item.date=selectedDay;
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight / 4,
      decoration: BoxDecoration(
        color: Color.fromRGBO(13, 71, 161, 1),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(10),
                    ),
                    child: Text(
                      'Create your todo',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(25),
                          fontFamily: 'MS',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.event,
                          size: ScreenUtil().setSp(30),
                          color: Colors.white,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: ScreenUtil().setWidth(10),
                          ),
                          child: GestureDetector(
                            onTap: () => selectDate(context ),
                            child: Container(
                            //  color: Colors.redAccent,
                              child: Text(
                                '${item.date.day > 10
                                    ? '${item.date.day}'
                                    : '0${item.date.day}'}/${item.date.month > 10
                                    ? '${item.date.month}'
                                    : '0${item.date.month}'}/${item.date.year}',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(18),
                                    fontFamily: 'MS',
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(ScreenUtil().setWidth(20)),
              padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
              child: Image.asset(
                'assets/images/logokit1.png',
                fit: BoxFit.fill,
              ),
            ),
          )
        ],
      ),
    );
  }
 void selectDate(BuildContext context ) async {
//log("@@@@@@@@@@@@@2");
   //  final item = Provider.of<TodoItem>(context);
   final DateTime picked = await showDatePicker(
       context: context,
       initialDate: selectedDay,
       firstDate: DateTime(2015, 8),
       lastDate: DateTime(2101));
   if (picked != null  ) {
     context.read<TodoItem>().setDate(picked);
     selectedDay=picked;
     //log(selectedDay.day);
   }
 }



}
