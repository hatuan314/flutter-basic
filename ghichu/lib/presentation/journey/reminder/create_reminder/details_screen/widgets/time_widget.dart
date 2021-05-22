import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';
import 'package:table_calendar/table_calendar.dart';

class TimeWidget extends StatelessWidget {
  TimeOfDay pickedTime;
  DetailsBloc detailsBloc;
  TimeWidget({Key key, this.detailsBloc}) : super(key: key);
  var date;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DetailsState>(
        initialData: detailsBloc.detailsState,
        stream: detailsBloc.detailsController,
        builder: (context, snapshot) {
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
                                detailsBloc.tableCanlender();
                              },
                              child: Container(
                                height: ScreenUtil().setWidth(55),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom:
                                            BorderSide(color: Colors.black12))),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                      right: ScreenUtil().setWidth(10)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Date',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize:
                                                    ScreenUtil().setSp(15)),
                                          ),
                                          Visibility(
                                              visible: snapshot.data.date,
                                              child: Text(
                                                '${snapshot.data.timeDate}',
                                                style: TextStyle(
                                                    color: Colors.blue,
                                                    fontSize:
                                                        ScreenUtil().setSp(15)),
                                              ))
                                        ],
                                      ),
                                      FlutterSwitch(
                                        height: ScreenUtil().setHeight(30),
                                        width: ScreenUtil().setWidth(45),
                                        toggleSize: ScreenUtil().setHeight(20),
                                        borderRadius: ScreenUtil().setSp(20),
                                        activeColor: Colors.green,
                                        value: snapshot.data.date,
                                        onToggle: (value) {
                                          detailsBloc.setDateSwitch(value);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              )))
                    ],
                  ),
                  Visibility(
                      visible: snapshot.data.tableCalender,
                      child: TableCalendar(
                        daysOfWeekHeight: ScreenUtil().setHeight(20),
                        firstDay: DateTime.utc(2010, 10, 16),
                        lastDay: DateTime.utc(2030, 3, 14),
                        focusedDay: snapshot.data.dateTime,
                        selectedDayPredicate: (day) {
                          return isSameDay(snapshot.data.dateTime, day);
                        },
                        onDaySelected: (date, focusdate) {
                          detailsBloc.setDate(date);
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
                          detailsBloc.tableTimePicker();
                        },
                        child: Container(
                          height: ScreenUtil().setWidth(55),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black12))),
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(10)),
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
                                        visible: snapshot.data.time,
                                        child: Text(
                                          '${snapshot.data.hour}:${snapshot.data.minuner}',
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
                                  value: snapshot.data.time,
                                  // value: context.watch<ProviderDetailsPage>().time,
                                  onToggle: (values) {
                                    detailsBloc.setTimeSwitch(values);
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                      ))
                    ],
                  ),
                  Visibility(
                    visible: snapshot.data.timePicker,
                    child: Container(
                      margin:
                          EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                      width: double.infinity,
                      height: ScreenUtil().setHeight(50),
                      color: Colors.transparent,
                      padding:
                          EdgeInsets.only(right: ScreenUtil().setWidth(20)),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () async {
                            TimeOfDay initialTime = TimeOfDay.now();
                            pickedTime = await showTimePicker(
                              context: context,
                              initialTime: initialTime,
                            );
                            detailsBloc.setTimeHour(
                                pickedTime.hour, pickedTime.minute);
                          },
                          child: Container(
                            width: ScreenUtil().setWidth(60),
                            height: ScreenUtil().setHeight(35),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Text(
                              '${snapshot.data.hour}:${snapshot.data.minuner}',
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
        });
  }
}
