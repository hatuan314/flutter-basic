import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/new_reminder/create_new_reminder/reminder_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/new_reminder/create_new_reminder/widget/list_dialog_item.dart';
import 'package:reminders_app/reminders_app/presentation/journey/new_reminder/create_new_reminder/widget/text_field.dart';

import '../../reminders_list.dart';
import 'reminder_provider.dart';
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

  String now = DateTime.now().day < 10
      ? '0' + DateTime.now().day.toString()
      : DateTime.now().day.toString() +
          "/" +
          (DateTime.now().month < 10
              ? '0' + DateTime.now().month.toString()
              : DateTime.now().month.toString()) +
          "/" +
          DateTime.now().year.toString();
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
                    return listDialogItem(() => {
                      reminderStream.setList(RemindersList.MyLists[index].name),
                      Navigator.pop(context)
                    }, RemindersList
                        .MyLists[index].color,  RemindersList.MyLists[index].name, RemindersList.MyLists[index].list.length);
                  }))
        ]);
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
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
                    textField('Name',1, (value) => {
                      reminderStream.setTitle(value),
                      title = value,
                    }),
                      textField('Notes', 5, (value) => {
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
                      details = await Navigator.pushNamed(
                          context, RouteList.detailsScreen),
                      log(details['time'].toString()),
                   reminderStream.setDetails(details),
                    },
                    child: StreamBuilder(
                      stream: reminderStream.detailsStream,
                      builder:(context,snapshot)=> Padding(
                        padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                        child: snapshot.hasData
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
                                              snapshot.data['date'] != 0
                                                  ? (snapshot.data['time']!=0
                                                      ? '${(DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'])).compareTo(now) == 0 ? 'Today' : DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'])) == now ? 'Today' : DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'])).compareTo(now) == 0 ? 'Today' : DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'])))}, ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'] +  snapshot.data['time']))}, ${ snapshot.data['priority'] == 0 ? 'None' : ( snapshot.data['priority'] == 1 ? 'Low' : ( snapshot.data['priority'] == 2 ? 'Medium' : 'High'))}'
                                                      : '${(DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'])).compareTo(now) == 0 ? 'Today' : DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'])) == now ? 'Today' : DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'])).compareTo(now) == 0 ? 'Today' : DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( snapshot.data['date'])))}, ${ snapshot.data['priority'] == 0 ? 'None' : ( snapshot.data['priority'] == 1 ? 'Low' : ( snapshot.data['priority'] == 2 ? 'Medium' : 'High'))}')
                                                  : '${ snapshot.data['priority'] == 0 ? 'None' : ( snapshot.data['priority'] == 1 ? 'Low' : ( snapshot.data['priority'] == 2 ? 'Medium' : 'High'))}',
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
                          StreamBuilder(

                            stream: reminderStream.listStream,
                            initialData: 'Reminders',
                            builder:(context,snapshot)=> Expanded(
                              flex: 3,
                              child: Text(snapshot.hasData?snapshot.data:'Reminders',
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(12.5),
                                    color: Colors.grey,
                                  )),
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
          ],
        ),
      ),
    );
  }
  // Widget detailsDialog(BuildContext context) {

  // }

  Widget _appBar(BuildContext context) {
    int value;
    return AppBar(
      elevation: 0,
      leadingWidth: ScreenUtil().screenWidth / 5,
      leading: GestureDetector(
        onTap: () =>  showDialog(context: context, builder: (_)=>AlertDialog(
            title:Text('Cancel ?'),
            actions: [
              FlatButton(
                onPressed: () {Navigator.pop(context);},
                child: Text('No'),
              ),
              FlatButton(
                onPressed: () {Navigator.pop(context);Navigator.pop(context);},
                child: Text('Yes'),
              ),])),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Cancel',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(15)),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'New Reminder',
        style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w700),
      ),
      actions: [ StreamBuilder(
      stream: reminderStream.titleStream,
      builder:(context,snapshot)=>
    StreamBuilder(
    stream: reminderStream.notesStream,
    builder:(context,snapshot1)=>
    StreamBuilder(
    stream: reminderStream.listStream,
    builder:(context,snapshot2)=>
    StreamBuilder(
    stream: reminderStream.detailsStream,
    builder:(context,snapshot3)=>
    (snapshot.data == null ||
    snapshot1.data == null ||
    snapshot.data == '' ||
        snapshot1.data == '')? Container(
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
                      reminderStream.title,
                  reminderStream.notes,
    reminderStream.list,
                      reminderStream.details != null
                          ?  reminderStream.details['date'] +  reminderStream.details['time']
                          : 0,
                      reminderStream.details != null ?  reminderStream.details['priority'] : 0),
                  // log(value.toString()+'***********'),
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
    ))))
      ],
    );
  }
}
