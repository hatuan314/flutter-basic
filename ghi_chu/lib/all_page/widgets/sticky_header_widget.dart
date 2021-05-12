import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StickyHeaderAll extends StatelessWidget {
  String header;
  Map conTent;
  String color;
  StickyHeaderAll({Key key, this.header, this.conTent, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: StickyHeader(
        header: Container(
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
              children: List.generate(conTent.values.length, (index1) {
                //lay lenght cua tat ca time
                return Column(
                    children: List.generate(
                        conTent.values.elementAt(index1).length, (index) {
                  List<Reminder> reminder = conTent.values.elementAt(index1);
                  return Row(
                    children: [
                      Icon(Icons.check_circle_outlined),
                      SizedBox(
                        width: ScreenUtil().setWidth(7),
                      ),
                      Expanded(
                          child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: ScreenUtil().setHeight(10)),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.black26))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${reminder[index].title}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(17)),
                            ),
                            Visibility(
                                visible:
                                    reminder[index].date == null ? false : true,
                                child: Text(reminder[index].date == null
                                    ? ''
                                    : reminder[index].time
                                        ? '${DateFormat('HH:mm,dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(reminder[index].date))}'
                                        : '${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(reminder[index].date))}')),
                            Visibility(
                                visible:
                                    reminder[index].note == '' ? false : true,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenUtil().setHeight(7),
                                    ),
                                    Text(
                                      '${reminder[index].note}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: ScreenUtil().setSp(13)),
                                    )
                                  ],
                                ))
                          ],
                        ),
                      ))
                    ],
                  );
                }));
              }),
            )),
      ),
    );
  }
}
