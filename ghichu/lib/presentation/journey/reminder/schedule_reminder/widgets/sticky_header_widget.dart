import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_bloc.dart';
import 'package:ghichu/presentation/models/model_map.dart';
import 'package:ghichu/presentation/models/reminder.dart';

import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:intl/intl.dart';

import 'add_reminder_widget.dart';
import 'list_reminder_widget.dart';

class StickyHeaderWidget extends StatelessWidget {
  String title;
  int indexSticky;
  int indexReminder;
  List<TextEditingController> controler;
  ScheduleReminderBloc scheduleReminderBloc;
  StickyHeaderWidget(
      {Key key,
      this.scheduleReminderBloc,
      this.title,
      this.indexSticky,
      this.controler,
      this.indexReminder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      overlapHeaders: false,
        header: Container(
          height: ScreenUtil().setHeight(45),
          width: ScreenUtil().screenWidth,
          color: Colors.white,
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
          alignment: Alignment.centerLeft,
          child: Text(
            '${title}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(23)),
          ),
        ),
        content: Container(
          width: ScreenUtil().screenWidth,
          color: Colors.white,
          child: Column(
            children: [
              Column(
                  // Text('${ModelListReminder.listReminder.values.elementAt(index)['${title}'][index1].title}');
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                      ModelListReminder.listReminder.values.length, (index) {
                    return Column(
                      children: List.generate(
                          ModelListReminder.listReminder.values
                                      .elementAt(index)['${title}'] ==
                                  null
                              ? 0
                              : ModelListReminder.listReminder.values
                                  .elementAt(index)['${title}']
                                  .length, (index1) {
                        List<Reminder> reminder = ModelListReminder
                            .listReminder.values
                            .elementAt(index)['${title}'];
                        indexReminder = indexReminder + 1;
                        return ListReminderSchedule(
                            scheduleReminderBloc: scheduleReminderBloc,
                            createAt: reminder[index1].createAt,
                            reminder: reminder[index1],
                            keyDate: title,
                            controller: controler,
                            index: indexReminder,
                            indexSticky: indexSticky,
                            title: reminder[index1].title,
                            note: reminder[index1].note,
                            group: reminder[index1].group,
                            time: reminder[index1].time,
                            date: reminder[index1].date);
                      }),
                    );
                  })),
              AddReminder(
                scheduleReminderBloc: scheduleReminderBloc,
                index: indexSticky,
                controller: controler,
                keyDate: title,
              )
            ],
          ),
        ));
  }
}
