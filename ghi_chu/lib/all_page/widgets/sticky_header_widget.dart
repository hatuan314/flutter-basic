import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/all_page/widgets/add_widget.dart';
import 'package:ghi_chu/all_page/widgets/list_reminder_all.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StickyHeaderAll extends StatelessWidget {
  String header;
  Map conTent;
  String color;
  int indexHeader, indexReminder;
  List<TextEditingController> controller;
  StickyHeaderAll(
      {Key key,
      this.header,
      this.conTent,
      this.color,
      this.controller,
      this.indexHeader,
      this.indexReminder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: Container(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
        height: ScreenUtil().setHeight(50),
        width: ScreenUtil().screenWidth,
        color: Colors.white,
        alignment: Alignment.centerLeft,
        child: Text(
          "${header}",
          style: TextStyle(
              color: Color(int.parse(color)),
              fontWeight: FontWeight.w700,
              fontSize: ScreenUtil().setSp(25)),
        ),
      ),
      content: Container(
          width: ScreenUtil().screenWidth,
          color: Colors.transparent,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Column(
                  children: List.generate(conTent.values.length, (index1) {
                    //lay lenght cua tat ca time
                    return Column(
                        children: List.generate(
                            conTent.values.elementAt(index1).length, (index) {
                      List<Reminder> reminder =
                          conTent.values.elementAt(index1);
                      indexReminder = indexReminder + 1;
                      return ListReminderAll(
                        controller: controller,
                        index: indexReminder,
                        indexGroup: indexHeader,
                        title: reminder[index].title,
                        note: reminder[index].note,
                        date: reminder[index].date,
                        time: reminder[index].time,
                        group: reminder[index].group,
                        createAt: reminder[index].createAt,
                        reminder: reminder[index],
                      );
                    }));
                  }),
                ),
              ),
              AddWidget(
                index: indexHeader,
                group: header,
                controller: controller,
              )
            ],
          )),
    );
  }
}
