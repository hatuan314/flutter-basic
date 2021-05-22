import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_bloc.dart';
import 'package:ghichu/presentation/models/model_map.dart';
import 'package:ghichu/presentation/models/reminder.dart';

import 'package:intl/intl.dart';

class ListReminderSchedule extends StatelessWidget {
  String group, title, note, keyDate;
  int date;
  bool time;
  int indexSticky;
  int index;
  int createAt;
  Reminder reminder;
  ScheduleReminderBloc scheduleReminderBloc;
  List<TextEditingController> controller;
  ListReminderSchedule(
      {Key key,
      this.scheduleReminderBloc,
      this.group,
      this.title,
      this.note,
      this.date,
      this.time,
      this.indexSticky,
      this.index,
      this.controller,
      this.keyDate,
      this.createAt,
      this.reminder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        scheduleReminderBloc.setIndexReminder(index, indexSticky);
        scheduleReminderBloc.scheduleReminderState.indexSticky = null;
        for (int i = 0;
            i < scheduleReminderBloc.scheduleReminderState.key1.length;
            i++) {
          if (controller[i].text != '') {
            scheduleReminderBloc.scheduleReminderState.addReminder(
                controller[i],
                controller[i].text,
                ModelListReminder.myList.keys.elementAt(0));
            controller[i].text = '';
          }
        }
      },
      child: Row(
        children: [
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Icon(Icons.check_circle_outline_outlined),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(10),
                      top: ScreenUtil().setHeight(10)),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${title}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(16)),
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(5),
                          ),
                          Row(
                            children: [
                              Text(
                                '${group}',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: ScreenUtil().setSp(14)),
                              ),
                              Visibility(
                                  visible: time,
                                  child: Text(
                                    ' - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(date))}',
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: ScreenUtil().setSp(14)),
                                  ))
                            ],
                          ),
                          Visibility(
                              visible: note == '' ? false : true,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: ScreenUtil().setHeight(5),
                                  ),
                                  Text(
                                    '${note}',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: ScreenUtil().setSp(14)),
                                  )
                                ],
                              ))
                        ],
                      ),
                      Visibility(
                          visible: indexSticky ==
                                  scheduleReminderBloc
                                      .scheduleReminderState.indexStickyReminder
                              ? index ==
                                      scheduleReminderBloc
                                          .scheduleReminderState.indexReminder
                                  ? true
                                  : false
                              : false,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(15)),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, RouteList.editReminder,
                                    arguments: {
                                      'group': group,
                                      'title': title,
                                      'note': note,
                                      'date': date,
                                      'time': time,
                                      'createAt': createAt,
                                      'reminder': reminder
                                    }).whenComplete(() {
                                  scheduleReminderBloc
                                      .scheduleReminderState.key1 = [];
                                  scheduleReminderBloc.scheduleReminderState
                                      .addTextEditing();
                                  scheduleReminderBloc.getKey();
                                });
                              },
                              child: Icon(
                                Icons.error_outline,
                                size: ScreenUtil().setSp(23),
                                color: Colors.red,
                              ),
                            ),
                          )),
                    ],
                  ))),
        ],
      ),
    );
  }
}
