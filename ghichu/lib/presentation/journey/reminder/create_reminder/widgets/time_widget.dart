import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/create_reminder_constants.dart';
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
                  detailsSwitch(
                    isTime: false,
                    snapshot: snapshot,
                    title: CreateReminderConstants.detailsSwitchDate,
                    isPicker: () {
                      detailsBloc.tableCanlender();
                    },
                    isSwitch: (value) {
                      detailsBloc.setDateSwitch(value);
                    },
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
                  detailsSwitch(
                    snapshot: snapshot,
                    isTime: true,
                    title: CreateReminderConstants.detailsSwitchTime,
                    isPicker: () {
                      detailsBloc.tableTimePicker();
                    },
                    isSwitch: (values) {
                      detailsBloc.setTimeSwitch(values);
                    },
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

  Widget detailsSwitch(
      {@required AsyncSnapshot<DetailsState> snapshot,
      @required bool isTime,
      @required String title,
      @required Function isPicker,
      @required Function isSwitch}) {
    return Row(
      children: [
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        Container(
          height: CreateReminderConstants.detailsSwitchSizeIcon,
          width: CreateReminderConstants.detailsSwitchSizeIcon,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Icon(
              CreateReminderConstants.detailsIcon,
              color: Colors.white,
              size: CreateReminderConstants.sizeIcon,
            ),
          ),
        ),
        SizedBox(
          width: ScreenUtil().setWidth(10),
        ),
        Expanded(
            child: GestureDetector(
                onTap: isPicker,
                child: Container(
                  height: CreateReminderConstants.heightContainer,
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.black12))),
                  child: Padding(
                    padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(title,
                                style: CreateReminderConstants.textStyleDate),
                            isTime
                                ? Visibility(
                                    visible: snapshot.data.time,
                                    child: Text(
                                      '${snapshot.data.hour}:${snapshot.data.minuner}',
                                      style: CreateReminderConstants
                                          .textStyleTimer,
                                    ))
                                : Visibility(
                                    visible: snapshot.data.date,
                                    child: Text(
                                      '${snapshot.data.timeDate}',
                                      style: CreateReminderConstants
                                          .textStyleTimer,
                                    ))
                          ],
                        ),
                        FlutterSwitch(
                          height: CreateReminderConstants.heightSwitch,
                          width: CreateReminderConstants.witdhSwitch,
                          toggleSize: CreateReminderConstants.toggleSizeSwitch,
                          borderRadius:
                              CreateReminderConstants.borderRadiusSwitch,
                          activeColor: Colors.green,
                          value:
                              isTime ? snapshot.data.time : snapshot.data.date,
                          onToggle: isSwitch,
                        )
                      ],
                    ),
                  ),
                )))
      ],
    );
  }
}
