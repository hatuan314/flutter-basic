import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:intl/intl.dart';

import 'package:reminders_app/reminders_app/common/extensions/date_extensions.dart';
import 'package:reminders_app/reminders_app/common/enums/priority_type.dart';
import 'package:reminders_app/reminders_app/common/utils/priority_type_utils.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/bloc/details_state.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/bloc/details_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/details_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/widget/details_item.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/widget/priority_item.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/new_reminder_constants.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/appbar.dart';

class DetailsScreen extends StatefulWidget {
  int date;
  int time;
  int priority;

  DetailsScreen({this.date, this.time, this.priority});

  @override
  State<StatefulWidget> createState() => _DetailsScreen(date: date,time: time,priority: priority);
}

class _DetailsScreen extends State<DetailsScreen> {
  DetailsStream detailsStream = DetailsStream();
  int date;
  int time;
  int priority;

  _DetailsScreen({this.date, this.time, this.priority});
  @override
  void dispode() {
    detailsStream.dispose();
    super.dispose();
  }

  String selectedPriority = 'None';

  @override
  Widget build(BuildContext context) {
    final SimpleDialog priorityDialog = SimpleDialog(
      titlePadding: EdgeInsets.only(
        top: ScreenUtil().setHeight(15),
        left: ScreenUtil().setWidth(15),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 0,
      ),
      title: Text(
        DetailConstants.priorityTxt,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
      children: [
        PriorityItemWidget(
          name: priorityTypeUtil(PriorityType.NONE),
          color: Colors.grey,
          onTap: () => {
            detailsStream.setPriority(0),
            Navigator.pop(context),
            selectedPriority = priorityTypeUtil(PriorityType.NONE),
            log(selectedPriority)
          },
          isNotLast: true,
        ),
        PriorityItemWidget(
            name: priorityTypeUtil(PriorityType.LOW),
            color: Colors.yellow,
            onTap: () => {
                  detailsStream.setPriority(1),
                  Navigator.pop(context),
                  selectedPriority = priorityTypeUtil(PriorityType.LOW),
                  log(selectedPriority)
                },
            isNotLast: true),
        PriorityItemWidget(
            name: priorityTypeUtil(PriorityType.MEDIUM),
            color: Colors.orange,
            onTap: () => {
                  detailsStream.setPriority(2),
                  Navigator.pop(context),
                  selectedPriority = priorityTypeUtil(PriorityType.MEDIUM),
                  log(selectedPriority)
                },
            isNotLast: true),
        PriorityItemWidget(
            name: priorityTypeUtil(PriorityType.HIGH),
            color: Colors.red,
            onTap: () => {
                  detailsStream.setPriority(3),
                  Navigator.pop(context),
                  selectedPriority = priorityTypeUtil(PriorityType.HIGH),
                  log(selectedPriority)
                },
            isNotLast: false),
      ],
    );

    /// Kiểm tra date nhập vào có phải Today hay không?
    String now = DateTime.now().dateDdMMyyyy;
detailsStream.setDefault(date, time, priority);
    return StreamBuilder<DetailsState>(
        initialData: DetailsState(
           hasTime: time!=0?true:false, hasDate:date!=0?true: false, time: time, date: date, priority: priority),
        stream: detailsStream.detailsStream,
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
                appBar: _appBar(context, snapshot.data),
                body: Column(children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: DetailConstants.marginHorizontal,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: GridView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          childAspectRatio: 6,
                        ),
                        children: [
                          DetailsItem(
                            title: DetailConstants.dateTxt,
                            subtitle: snapshot.data.hasDate == true
                                ? DateTime.fromMillisecondsSinceEpoch(
                                                snapshot.data.date).isToday
                                : '',
                            icon: Icons.calendar_today_sharp,
                            bgIcon: Colors.red,
                            switchValue: snapshot.data.hasDate,
                            switchOnChanged: (bool value) {
                              selectDate(context, value);
                              detailsStream.setTime(TimeOfDay.now(), false);
                            },
                            onTapItem: (){
                              if(snapshot.data.hasDate)
                                {
                                selectDate(context, snapshot.data.hasDate);}
                            },
                          ),
                          DetailsItem(
                            title: DetailConstants.timeTxt,
                            subtitle:(snapshot.data.hasDate && snapshot.data.hasTime  )
                                ? DateFormat('HH:mm').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        snapshot.data.date +
                                            snapshot.data.time))
                                : '',
                            icon: Icons.timer,
                            bgIcon: Colors.blue,
                            switchValue: detailsStream.hasDate == true
                                ? snapshot.data.hasTime
                                : false,
                            switchOnChanged: (bool value) {
                              if (snapshot.data.hasDate)
                                selectTime(context, value);
                            },
                            onTapItem: (){
                              if (snapshot.data.hasDate && snapshot.data.hasTime)
                                selectTime(context, snapshot.data.hasTime);
                            },
                          ),
                        ]),
                  ),
                  Container(
                    margin: EdgeInsets.all(
                      DetailConstants.marginHorizontal,
                    ),
                    padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: GestureDetector(
                      onTap: () async {
                        await showDialog(
                            context: context,
                            builder: (context) => priorityDialog);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 9,
                              child: Text(
                                DetailConstants.priorityTxt,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(15),
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                  getPriorityTypeText(snapshot.data.priority),
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(12.5),
                                    color: Colors.grey,
                                  )),
                            ),
                            Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: ScreenUtil().setSp(15),
                                  color: Colors.grey,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ])),
          );
        });
  }

  String getPriorityTypeText(int intPriority) {
    switch (intPriority) {
      case 1:
        return priorityTypeUtil(PriorityType.LOW);
      case 2:
        return priorityTypeUtil(PriorityType.MEDIUM);
      case 3:
        return priorityTypeUtil(PriorityType.HIGH);
      default:
        return priorityTypeUtil(PriorityType.NONE);
    }
  }

  void selectTime(BuildContext context, bool hasTime) async {
    if (hasTime) {
      final TimeOfDay newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (newTime != null) {
        detailsStream.setTime(newTime, hasTime);
      }
    } else {
      detailsStream.setTime(TimeOfDay.now(), hasTime);
    }
  }

  void selectDate(BuildContext context, bool hasDate) async {
    if (hasDate) {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null) {
        detailsStream.setDate(picked, hasDate);
      }
    } else {
      detailsStream.setDate(DateTime.now(), hasDate);
    }
  }

  Widget _appBar(BuildContext context, DetailsState detailsState) {
    return AppbarWidget(
      
      context,
      leadingText: NewReminderConstants.newReminderTxt,
      title: NewReminderConstants.detailTxt,
      actionText: DetailConstants.saveTxt,
      onTapAction:GestureDetector (
      onTap: ()=> {
        Navigator.pop(
            context,
            ({
              'date': detailsState.date,
              'time': detailsState.time,
              'priority': detailsState.priority
            })),
      },
      child: Container(
        //color: Colors.blue,
        width: ScreenUtil().screenWidth / 6,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Save',
            style: TextStyle(
                color: Colors.blue,
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ),
      onTapCancel: ()=>{log('cancel'), Navigator.pop(context),},
    );
  }
}
