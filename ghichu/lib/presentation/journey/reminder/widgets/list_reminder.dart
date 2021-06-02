import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/bloc/all_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/bloc/all_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/today_reminder/bloc/today_reminder_bloc.dart';
import 'package:ghichu/presentation/models/model_map.dart';
import 'package:ghichu/presentation/models/reminder.dart';
import 'package:intl/intl.dart';

class ListReminder extends StatelessWidget {
  String title, group, note;
  int date, createAt;
  bool time;
  List<TextEditingController> controller;
  Reminder reminder;
  AllReminderBloc allReminderBloc;
  ScheduleReminderBloc scheduleReminderBloc;
  TodayReminderBloc todayReminderBloc;
  int indexReminder, indexGroup, index;
  ListReminder(
      {Key key,
      this.title,
        this.todayReminderBloc,
      this.scheduleReminderBloc,
      this.indexReminder,
      this.group,
      this.note,
      this.date,
      this.indexGroup,
      this.time,
      this.allReminderBloc,
      this.controller,
      this.createAt,
      this.reminder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle_outlined),
        SizedBox(
          width: ScreenUtil().setWidth(7),
        ),
        Expanded(
            child: GestureDetector(
          onTap: () {
            if (allReminderBloc != null) {
              allReminderBloc.allReminderState.indexGroup = null;
              allReminderBloc.setIndexReminder(indexReminder, indexGroup);

            } else if(scheduleReminderBloc!=null) {
              scheduleReminderBloc.scheduleReminderState.indexGroup = null;
              scheduleReminderBloc.setIndexReminder(indexReminder, indexGroup);

              // allReminderBloc.allReminderState.indexGroup = null;
              // allReminderBloc.setIndexReminder(indexReminder);
              // for (int i = 0; i < ModelListReminder.myList.length; i++) {
              //   if (controller[i].text.isNotEmpty &&
              //       indexReminder != allReminderBloc.allReminderState.indexGroup) {
              //     allReminderBloc.addAll(
              //         allReminderBloc.allReminderState.group, controller[i].text);
              //   }
              //   controller[i].text = '';
              // }
            }else{
              todayReminderBloc.todayReminderState.indexGroupReminder=0;
              todayReminderBloc.setIndexReminder(indexReminder);
            }
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(10)),
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black26))),
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
                          fontSize: ScreenUtil().setSp(18)),
                    ),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    ),
                    group == null
                        ? SizedBox()
                        : Row(
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
                    group != null
                        ? SizedBox()
                        : Visibility(
                            visible: date == null ? false : true,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: ScreenUtil().setHeight(5),
                                ),
                                Text(
                                  date == null
                                      ? ''
                                      : time
                                          ? '${DateFormat('HH:mm,dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(date))}'
                                          : '${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(date))}',
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: ScreenUtil().setSp(14)),
                                ),
                              ],
                            )),
                    Visibility(
                        visible: note == '' ? false : true,
                        child: Column(
                          children: [
                            SizedBox(
                              height: ScreenUtil().setHeight(7),
                            ),
                            Text(
                              '${note}',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: ScreenUtil().setSp(13)),
                            )
                          ],
                        )),
                    SizedBox(
                      height: ScreenUtil().setHeight(5),
                    )
                  ],
                ),
                StreamBuilder(
                    initialData: allReminderBloc == null
                        ? scheduleReminderBloc==null?todayReminderBloc.todayReminderState:scheduleReminderBloc.scheduleReminderState
                        : allReminderBloc.allReminderState,
                    stream: allReminderBloc == null
                        ? scheduleReminderBloc==null?todayReminderBloc.todayReminderController:scheduleReminderBloc.streamController
                        : allReminderBloc.allController,
                    builder: (context, snapshot) {
                      return Padding(
                        padding:
                            EdgeInsets.only(right: ScreenUtil().setWidth(15)),
                        child: Visibility(
                            visible: indexGroup ==
                                    snapshot.data.indexGroupReminder
                                ? indexReminder ==
                                snapshot.data.indexReminder
                                    ? true
                                    : false
                                : false,
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
                                  // allReminderBloc.update();
                                });
                              },
                              child: Icon(
                                Icons.error_outline,
                                size: ScreenUtil().setSp(25),
                                color: Colors.red,
                              ),
                            )),
                      );
                    }),
              ],
            ),
          ),
        )),
      ],
    );
  }
}