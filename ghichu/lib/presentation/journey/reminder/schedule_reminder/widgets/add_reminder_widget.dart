import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_bloc.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class AddReminder extends StatelessWidget {
  int index;
  int oldIndex;
  List<TextEditingController> controller;
  String keyDate;
  ScheduleReminderBloc scheduleReminderBloc;
  AddReminder(
      {Key key,
      this.scheduleReminderBloc,
      this.index,
      this.controller,
      this.keyDate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (h) {
        scheduleReminderBloc.scheduleReminderState.indexSticky = null;
        scheduleReminderBloc.scheduleReminderState.addReminder(
            controller[index],
            controller[index].text,
            ModelListReminder.myList.keys.elementAt(0));
        scheduleReminderBloc.update();
      },
      style: TextStyle(fontSize: ScreenUtil().setSp(16)),
      controller: controller[index],
      onTap: () {
        scheduleReminderBloc.scheduleReminderState.indexReminder = null;
        oldIndex = scheduleReminderBloc.scheduleReminderState.indexSticky;
        scheduleReminderBloc.scheduleReminderState.setFoucs(index);
        try {
          if (oldIndex !=
              scheduleReminderBloc.scheduleReminderState.indexSticky) {
            scheduleReminderBloc.scheduleReminderState.addReminder(
                controller[oldIndex],
                controller[oldIndex].text,
                ModelListReminder.myList.keys.elementAt(0));
          }
        } catch (_) {}
        scheduleReminderBloc.scheduleReminderState.keyDate = keyDate;
        scheduleReminderBloc.update();
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1),
        ),
        suffixIcon: Visibility(
            visible:
                index == scheduleReminderBloc.scheduleReminderState.indexSticky
                    ? true
                    : false,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteList.editReminder,
                    arguments: {
                      'group': 'Reminder',
                      'title': controller[index].text,
                      'note': '',
                      'date': null,
                      'time': false,
                      'createAt': DateTime.now().millisecondsSinceEpoch,
                      'reminder': 'none'
                    }).whenComplete(() {
                  for (int i = 0; i < ModelListReminder.myList.length; i++) {
                    controller[i].text = '';
                  }
                  scheduleReminderBloc.scheduleReminderState.key1 = [];
                  scheduleReminderBloc.scheduleReminderState.addTextEditing();
                  scheduleReminderBloc.getKey();
                });
              },
              child: Icon(
                Icons.error_outline,
                size: ScreenUtil().setSp(23),
                color: Colors.red,
              ),
            )),
        prefixIcon: Icon(
          Icons.add_circle_outlined,
          size: ScreenUtil().setSp(25),
          color: Colors.black45,
        ),
        helperText:
            index == scheduleReminderBloc.scheduleReminderState.indexSticky
                ? "${ModelListReminder.myList.keys.elementAt(0)}"
                : '',
        helperStyle:
            TextStyle(color: Colors.black45, fontSize: ScreenUtil().setSp(13)),
      ),
    );
  }
}
