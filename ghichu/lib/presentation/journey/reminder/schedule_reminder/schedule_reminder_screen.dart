import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/widgets/sticky_header_widget.dart';

class SchedulePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SchedulePage> {
  ScheduleReminderBloc scheduleReminderBloc = new ScheduleReminderBloc();
  String key;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: Text(
                'Schedule',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            StreamBuilder<ScheduleReminderState>(
                initialData: scheduleReminderBloc.scheduleReminderState,
                stream: scheduleReminderBloc.streamController,
                builder: (context, snapshot) {
                  return Column(
                    children: List.generate(snapshot.data.key1.length, (index) {
                      int indexReminder = 0;
                      return StickyHeaderWidget(
                        scheduleReminderBloc: scheduleReminderBloc,
                        indexReminder: indexReminder,
                        title: snapshot.data.key1[index],
                        indexSticky: index,
                        controler: snapshot.data.textEditing,
                      );
                    }),
                  );
                }),
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
      leadingWidth: ScreenUtil().setHeight(100),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      scheduleReminderBloc.scheduleReminderState.getKey();
      scheduleReminderBloc.addTextEditing();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //
    scheduleReminderBloc.dispose();
    super.dispose();
  }
}
