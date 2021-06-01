import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/common/enums/priority_type.dart';
import 'package:reminders_app/reminders_app/common/extensions/date_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/common/utils/priority_type_utils.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/bloc/reminder_stream.dart';

import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/widget/list_dialog_item.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/widget/text_field.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/details_screen.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/new_reminder_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminders_list.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/appbar.dart';
import 'bloc/reminder_state.dart';

class CreateNewReminder extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> _CreateNewReminder();

}
class _CreateNewReminder extends State<CreateNewReminder> {
  String title;
  String notes;
  DateTime date;
  String time;
  var details;

  String now = DateTime.now().dateDdMMyyyy;
  ReminderStream reminderStream = ReminderStream();
  @override
  void dispose() {
    reminderStream.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
reminderStream.setList('Reminders');
    final SimpleDialog listDialog = SimpleDialog(
        contentPadding: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(10),
          top: ScreenUtil().setHeight(10),
        ),
        title: Text(
          'Lists',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        children: [
          Container(
              height: ScreenUtil().screenWidth - 20,
              width: ScreenUtil().screenWidth - 20,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: RemindersList.MyLists.length,
                  itemBuilder: (context, index) {
                    return ListItemWidget(onTap:() => {
                      reminderStream.setList(RemindersList.MyLists[index].name),
                      Navigator.pop(context)
                    },bgIcon: RemindersList
                        .MyLists[index].color,  name:RemindersList.MyLists[index].name,length: RemindersList.MyLists[index].list.length);
                  }))
        ]);
    return StreamBuilder<ReminderState>(
      initialData: ReminderState(list: 'Reminders'),
      stream: reminderStream.reminderStream,
      builder: (context, snapshot) {
        return SafeArea(
          child: Scaffold(
            appBar: AppbarWidget(context,leadingText: 'Cancel',title: 'New Reminder',
              onTapAction:  (snapshot.data==null||snapshot.data.title == null ||
                  snapshot.data.title  == '' )? Container(
                //color: Colors.blue,
                width: ScreenUtil().screenWidth / 6,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ):
              GestureDetector(
                onTap: () => {

                  RemindersList.addReminder(
                      snapshot.data.title,
                      snapshot.data.notes==null?'':snapshot.data.notes,
                      snapshot.data.list,
                      snapshot.data.details != null
                          ?  snapshot.data.details['date'] +  snapshot.data.details['time']
                          : 0,
                      snapshot.data.details != null ?  snapshot.data.details['priority'] : 0),

                  Navigator.pop(context)
                },

                child: Container(
                  //color: Colors.blue,
                  width: ScreenUtil().screenWidth / 6,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
            body: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: EdgeInsets.all(
                    ScreenUtil().setWidth(10),
                  ),
                  child: Container(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(15)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        children: [
                        TextFieldWidget(hintText:NewReminderConstants.titleTxt,maxLine:1,onChanged: (value) => {
                          reminderStream.setTitle(value),
                          title = value,
                        }),
                          TextFieldWidget(hintText:NewReminderConstants.notesTxt,maxLine:5,onChanged: (value) => {
                            reminderStream.setNote(value),
                            notes = value,
                          })
                        ],
                      )),
                ),
                Padding(
                    padding: EdgeInsets.all(
                      ScreenUtil().setWidth(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () async => {

                          details = await Navigator.push(
                              context,
                          MaterialPageRoute(builder: (context)=>details==null?DetailsScreen(date: 0,time: 0,priority: 0):DetailsScreen(date: details['date'],time: details['time'],priority: details['priority'],))),
                       reminderStream.setDetails(details),
                        },
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                          child: snapshot.data.details!=null
                              ? Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Details',
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(15),
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(0.7)),
                                        child: Text(
                                          snapshot.data.details['date'] != 0
                                              ? (snapshot.data.details['time']!=0
                                              ? '${DateTime.fromMillisecondsSinceEpoch( snapshot.data.details['date']).isToday}, ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data.details['date'] +  snapshot.data.details['time']))}, ${ getPriorityTypeText(snapshot.data.details['priority'])}'
                                              : '${DateTime.fromMillisecondsSinceEpoch( snapshot.data.details['date']).isToday}, ${ getPriorityTypeText(snapshot.data.details['priority'])}')
                                              : '${getPriorityTypeText(snapshot.data.details['priority'])}',
                                          style: TextStyle(
                                              fontSize:
                                              ScreenUtil().setSp(12),
                                              fontWeight: FontWeight.w500,
                                              color: Colors.blue),
                                        ),
                                      ),
                                    ],
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: ScreenUtil().setSp(15),
                                    color: Colors.grey,
                                  )),
                            ],
                          )
                              : Row(
                            children: [
                              Expanded(
                                flex: 9,
                                child: Text(
                                  'Details',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
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
                Padding(
                    padding: EdgeInsets.all(
                      ScreenUtil().setWidth(10),
                    ),
                    child: GestureDetector(
                      onTap: () => showDialog(
                          context: context, builder: (context) => listDialog),
                      child: Container(
                        padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 9,
                                child: Text(
                                  'List',
                                  style: TextStyle(
                                      fontSize: ScreenUtil().setSp(15),
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(snapshot.data.list!=null?snapshot.data.list:'Reminders',
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
                  ],
                ),
              ),
            );
      }
    );
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




}
