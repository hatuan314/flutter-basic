import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/today_reminder/bloc/today_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/today_reminder/bloc/today_reminder_state.dart';
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
  TodayReminderBloc todayReminderBloc = TodayReminderBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hôm nay',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w800,
                  fontSize: ScreenUtil().setSp(30)),
            ),
            // ModelListReminder.listReminder.values.elementAt(index)['${Provider.of<ProviderToday>(context,listen: false).nowDate}'].length
            StreamBuilder<TodayReminderState>(
                initialData: todayReminderBloc.todayReminderState,
                stream: todayReminderBloc.todayReminderController,
                builder: (context, snapshot) {
                  return Column(
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
                  }));
                })
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: ScreenUtil().setSp(20),
              color: Colors.blue,
            ),
            Text(
              'Danh sách',
              style: TextStyle(
                  color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
            )
          ],
        ),
      ),
      leadingWidth: ScreenUtil().setWidth(100),
    );
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
