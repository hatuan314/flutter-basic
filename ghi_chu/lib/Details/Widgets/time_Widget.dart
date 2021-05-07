import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ghi_chu/Details/Provider.dart';
import 'package:ghi_chu/New_Reminder/ProviderReminder.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:provider/provider.dart';

class timeWidget extends StatelessWidget {
  TimeOfDay pickedTime;
  var date;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Container(
                  height: ScreenUtil().setWidth(25),
                  width: ScreenUtil().setWidth(25),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                      size: ScreenUtil().setWidth(16),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    context.read<switchdate>().tablecanlender();
                  },
                  child: Container(
                    height: ScreenUtil().setWidth(55),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Date',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(15)),
                              ),
                              Visibility(
                                  visible: context.watch<switchdate>().date,
                                  child: Text(
                                    '${context.watch<switchdate>().timedate}',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: ScreenUtil().setSp(15)),
                                  ))
                            ],
                          ),
                          FlutterSwitch(
                            height: ScreenUtil().setHeight(30),
                            width: ScreenUtil().setWidth(45),
                            toggleSize: ScreenUtil().setHeight(20),
                            borderRadius: ScreenUtil().setSp(20),
                            activeColor: Colors.green,
                            value: context.watch<switchdate>().date,
                            onToggle: (value) {
                              context.read<switchdate>().dateswitch(value);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
            Visibility(
                visible: context.watch<switchdate>().tablecalender,
                child: TableCalendar(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: context.watch<switchdate>().dateTime,
                  selectedDayPredicate: (day) {
                    return isSameDay(context.watch<switchdate>().dateTime, day);
                  },
                  onDaySelected: (date, focusdate) {

                    context.read<switchdate>().dateScheldul(date);
                  },
                )),
            Row(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Container(
                  height: ScreenUtil().setWidth(25),
                  width: ScreenUtil().setWidth(25),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Icon(
                      Icons.calendar_today_rounded,
                      color: Colors.white,
                      size: ScreenUtil().setWidth(16),
                    ),
                  ),
                ),
                SizedBox(
                  width: ScreenUtil().setWidth(10),
                ),
                Expanded(
                    child: GestureDetector(
                  onTap: () {
                    context.read<switchdate>().timepicke();
                  },
                  child: Container(
                    height: ScreenUtil().setWidth(55),
                    decoration: BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black12))),
                    child: Padding(
                      padding:
                          EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Time',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(15)),
                              ),
                              Visibility(
                                  visible: context.watch<switchdate>().time,
                                  child: Text(
                                    '${context.watch<switchdate>().hour}:${context.watch<switchdate>().minuner}',
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: ScreenUtil().setSp(12)),
                                  )),
                            ],
                          ),
                          FlutterSwitch(
                            height: ScreenUtil().setHeight(30),
                            width: ScreenUtil().setWidth(45),
                            toggleSize: ScreenUtil().setHeight(20),
                            borderRadius: ScreenUtil().setSp(20),
                            activeColor: Colors.green,
                            value: context.watch<switchdate>().time,
                            onToggle: (values) {
                              context.read<switchdate>().timeswitch(values);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
              ],
            ),
            Visibility(
              visible: context.watch<switchdate>().timepicker,
              child: Container(
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                width: double.infinity,
                height: ScreenUtil().setHeight(50),
                color: Colors.transparent,
                padding: EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () async {
                      TimeOfDay initialTime = TimeOfDay.now();
                      pickedTime = await showTimePicker(
                        context: context,
                        initialTime: initialTime,
                      );
                      context
                          .read<switchdate>()
                          .timehuor(pickedTime.hour, pickedTime.minute);
                    },
                    child: Container(
                      width: ScreenUtil().setWidth(60),
                      height: ScreenUtil().setHeight(35),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.all(Radius.circular(7))),
                      child: Text(
                        '${context.watch<switchdate>().hour}:${context.watch<switchdate>().minuner}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(20)),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
