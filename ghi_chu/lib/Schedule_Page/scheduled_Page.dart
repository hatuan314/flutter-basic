import 'dart:ui';
import 'package:ghi_chu/Schedule_Page/Widgets/Sticky_header.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:sticky_headers/sticky_headers.dart';

class scheduledPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<scheduledPage> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('${reminder.Scheduletest}');
        // Schedule = [];
        // newSchedule = [];
        // int index1 = 0;
        // DateFormat dateFormat = DateFormat("yyyy-MM-dd");
        // for (int i = 0; i < reminder.scheduled.length; i++) {
        //   newSchedule.add(dateFormat
        //       .parse(reminder.scheduled[i]['time'][0]['date'].toString()));
        // }
        // newSchedule.sort((a, b) => a.compareTo(b));
        // for (int i = 0; i < newSchedule.length - 1; i++) {
        //   for (int j = i + 1; j < newSchedule.length; j++) {
        //     if (newSchedule[i] == newSchedule[j]) {
        //       newSchedule.removeAt(i);
        //     }
        //   }
        // }
        //
        // for (int i = 0; i < newSchedule.length; i++) {
        //   Schedule.add([]);
        //   for (int j = 0; j < reminder.scheduled.length; j++) {
        //     if (newSchedule[i] ==
        //         dateFormat.parse(
        //             reminder.scheduled[j]['time'][0]['date'].toString())) {
        //       Schedule[i].add(reminder.scheduled[j]);
        //     }
        //   }
        // }
        // print('${Schedule[0]}');
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Text(
                  'Scheduled',
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      fontSize: ScreenUtil().setSp(30)),
                ),
              ),
              Column(
                children: List.generate(reminder.Scheduletest.length, (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     stickyHeader(data: reminder.Scheduletest[index])
                    ],
                  );
                }),
              )
            ],
          ),
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
                'Lists',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(12)),
              )
            ],
          ),
        ));
  }
}
