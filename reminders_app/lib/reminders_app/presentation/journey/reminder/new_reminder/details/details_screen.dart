import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/bloc/details_state.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/bloc/details_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/widget/details_item.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/widget/priority_list_item.dart';

class DetailsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_DetailsScreen();

}
class _DetailsScreen extends State<DetailsScreen> {
  DetailsStream detailsStream = DetailsStream();
  @override
  void dispode()
  {
detailsStream.dispose();
super.dispose();
  }
  String selectedPriority='None';
  @override
  Widget build(BuildContext context) {

    final SimpleDialog priorityDialog = SimpleDialog(
      titlePadding: EdgeInsets.only(
        top: ScreenUtil().setHeight(15),
        left: ScreenUtil().setWidth(15),
      ),
      contentPadding: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(0),
        top: ScreenUtil().setHeight(0),
      ),
      title: Text(
        'Priority',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
      children: [
        priorityListItem('None', Colors.grey, () => {detailsStream.setPriority(0), Navigator.pop(context), selectedPriority='None',log(selectedPriority)}, true),
        priorityListItem('Low', Colors.yellow, () => {detailsStream.setPriority(1), Navigator.pop(context), selectedPriority='Low',log(selectedPriority)}, true),
        priorityListItem('Medium', Colors.orange, () => {detailsStream.setPriority(2), Navigator.pop(context), selectedPriority='Medium',log(selectedPriority)}, true),
        priorityListItem('High', Colors.red, () => {detailsStream.setPriority(3), Navigator.pop(context), selectedPriority='High',log(selectedPriority)}, false),
      ],
    );
    String now =  DateTime.now().day<10?'0'+DateTime.now().day.toString():DateTime.now().day.toString() + "/" +(DateTime.now().month<10?'0'+DateTime.now().month.toString():DateTime.now().month.toString()) + "/" +
        DateTime.now().year.toString();

    return StreamBuilder<DetailsState>(
      initialData: DetailsState(hasTime: false,hasDate: false,time: 0,date: 0,priority: 0),
      stream: detailsStream.detailsStream,
      builder: (context, snapshot) {
        return SafeArea(
          child: Scaffold(
              appBar: _appBar(context,snapshot.data),
              body: Column(children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: ScreenUtil().setWidth(20),
                    right: ScreenUtil().setWidth(20),
                  ),
                  child: Container(
                    //   padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
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
                           detailsItem('Date', snapshot.data.hasDate==true
                               ? (DateFormat('dd/MM/yyyy')
                               .format(
                               DateTime.fromMillisecondsSinceEpoch(snapshot.data.date))
                               .compareTo(now) == 0 ? 'Today' : DateFormat(
                               'dd/MM/yyyy').format(
                               DateTime.fromMillisecondsSinceEpoch(snapshot.data.date)))
                               : '',
                             Icons.calendar_today_sharp, Colors.red, snapshot.data.hasDate, (
                                 bool value) {
                               selectDate(context, value);
                             },),

                          detailsItem('Time', snapshot.data.hasTime==true ? DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(snapshot.data.date+snapshot.data.time)) : '',
                            Icons.timer, Colors.blue, detailsStream.hasDate==true?  snapshot.data.hasTime: false, (bool value) {

                            if (snapshot.data.hasDate )
                                selectTime(context, value);
                            },),
                        ]),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(
                      ScreenUtil().setWidth(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () async => await {
                          showDialog(
                              context: context,
                              builder: (context) => priorityDialog)
                        },
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 9,
                                child: Text(
                                  'Priority',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(snapshot.hasData?(snapshot.data.priority==1)?'Low':(snapshot.data.priority==2?'Medium':(snapshot.data.priority==3?'High':'None')):'None',
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
                    )),
              ])),
        );
      }
    );
  }

  void selectTime(BuildContext context, bool hasTime) async {
    if (hasTime) {
      final TimeOfDay newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (newTime != null) {
        detailsStream.setTime(newTime, hasTime);
        //   time=newTime;
        // log(item.time.toString());
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
        // selectedDay=picked;
        //log(selectedDay.day);
      }
    } else {
      detailsStream.setDate(DateTime.now(), hasDate);
    }
  }

  Widget _appBar(BuildContext context, DetailsState detailsState) {
    int value;
    return AppBar(
      elevation: 0,
      leadingWidth: ScreenUtil().screenWidth / 4,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.blue, size: ScreenUtil().setSp(15)),
              ),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'New\nReminder',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'Details',
        style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w700),
      ),
      actions: [
        GestureDetector(
          onTap: () => {
            Navigator.pop(
                context,
                ({
                  'date': detailsState.date,
                  'time':detailsState.time,
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
      ],
    );
  }
}
