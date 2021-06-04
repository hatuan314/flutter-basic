import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/today_reminder/bloc/today_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/today_reminder/bloc/today_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/app_bar_reminder.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/list_reminder.dart';
import 'package:ghichu/presentation/models/model_map.dart';
import 'package:ghichu/presentation/models/reminder.dart';
import 'package:intl/intl.dart';

class TodayPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TodayPage> {
  int lenghtToDay = 0;
  bool isEdit;
  TodayReminderBloc todayReminderBloc = TodayReminderBloc();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<TodayReminderState>(
        initialData: todayReminderBloc.todayReminderState,
        stream: todayReminderBloc.todayReminderController,
        builder: (context, snapshot) {
          if (snapshot.data.indexReminder == null) {
            isEdit = false;
          } else {
            isEdit = true;
          }
          return Scaffold(
            appBar: AppBarReminderWidget(
              isIconEdit: isEdit,
              actions: isEdit ? () {
                todayReminderBloc.todayReminderState.indexReminder=null;
                todayReminderBloc.update();
              } : null,
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                    child: Text(
                      'Hôm nay',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w800,
                          fontSize: ScreenUtil().setSp(30)),
                    ),
                  ),
                  Column(
                      children: List.generate(
                          ModelListReminder.listReminder.values
                                  .elementAt(0)
                                  .isEmpty
                              ? 0
                              : ModelListReminder.listReminder.values.length,
                          (index) {
                    return Column(
                      children: List.generate(
                          ModelListReminder.listReminder.values.elementAt(
                                      index)['${snapshot.data.nowDate}'] ==
                                  null
                              ? 0
                              : ModelListReminder.listReminder.values
                                  .elementAt(index)['${snapshot.data.nowDate}']
                                  .length, (index1) {
                        List<Reminder> reminder = ModelListReminder
                            .listReminder.values
                            .elementAt(index)['${snapshot.data.nowDate}'];
                        return ListReminder(
                          indexGroup: 0,
                          todayReminderBloc: todayReminderBloc,
                          indexReminder: index1,
                          title: reminder[index1].title,
                          note: reminder[index1].note,
                          group: reminder[index1].group,
                          time: reminder[index1].time,
                          date: reminder[index1].date,
                        );
                      }),
                    );
                  }))
                ],
              ),
            ),
          );
        });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      todayReminderBloc.getToday();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    todayReminderBloc.dispose();
    super.dispose();
  }
}
