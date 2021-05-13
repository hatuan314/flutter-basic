import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/home_page/homepage_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'reminder_provider.dart';

class CreateNewReminder extends StatelessWidget {
  String title;
  String notes;
  DateTime date;
  String time;
  var details;

  String now = DateTime.now().day.toString() +
      "/" +
      DateTime.now().month.toString() +
      "/" +
      DateTime.now().year.toString();
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ReminderProvider>(context, listen: false);
    //context.read<ReminderProvider>().setDefault();

    final SimpleDialog listDialog = SimpleDialog(
        contentPadding: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(10),
          top: ScreenUtil().setHeight(10),
          // left: ScreenUtil().setWidth(20),
          // right: ScreenUtil().setWidth(20),
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
                //  borderRadius: Bor
              ),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: RemindersList.MyLists.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () => {
                              item.setList(RemindersList.MyLists[index].name),
                              Navigator.pop(context)
                            },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin:
                                    EdgeInsets.all(ScreenUtil().setWidth(10)),
                                padding:
                                    EdgeInsets.all(ScreenUtil().setWidth(10)),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          // alignment: Alignment.topLeft,
                                          padding: EdgeInsets.all(
                                              ScreenUtil().setWidth(5)),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: RemindersList
                                                .MyLists[index].color,
                                          ),
                                          child: Icon(
                                            Icons.list,
                                            size: ScreenUtil().setSp(22),
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 22,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          RemindersList.MyLists[index].name,
                                          // textAlign: TextAlign.left,
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(15),
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                          '${RemindersList.MyLists[index].list.length}',
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(15),
                                              color: Colors.grey,
                                              fontWeight: FontWeight.w600),
                                        )),
                                    /*   Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: ScreenUtil().setSp(15),
                                  color: Colors.grey,
                                )),*/
                                  ],
                                ),
                              ),
                              Container(
                                  height: ScreenUtil().setHeight(0.2),
                                  width: ScreenUtil().screenWidth - 50,
                                  color: Colors.grey),
                            ]));
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
                      TextField(
                        // controller: textTitle,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        textAlign: TextAlign.start,
                        onChanged: (value) => {
                          context.read<ReminderProvider>().setTitle(value),
                          title = value,
                          //  log(title),
                        },
                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              fontFamily: 'MS',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          // enabled: false,
                          //   border: InputBorder.none,
                        ),
                      ),
                      TextField(
                        // controller: textTitle,
                        maxLines: 5,
                        textCapitalization: TextCapitalization.sentences,
                        textAlign: TextAlign.start,
                        onChanged: (value) => {
                          context.read<ReminderProvider>().setNote(value),
                          notes = value,
                          //  log(title),
                        },

                        decoration: InputDecoration(
                          hintText: 'Notes',
                          hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              fontFamily: 'MS',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          // enabled: false,
                          border: InputBorder.none,
                        ),
                      ),
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
                      //   log(details.toString()),
                      context.read<ReminderProvider>().setDetails(details),
                    },
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                      child: item.details != null
                          ? Row(
                              children: [
                                Expanded(
                                    flex: 9,
                                    child: Column(
                                    
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Details',
                                          style: TextStyle(
                                              fontSize: ScreenUtil().setSp(15),
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: ScreenUtil().setHeight(0.7)),
                                          child: Text(
                                            item.details['date'] != ''
                                                ? (item.details['time'] != ''
                                                    ? '${(item.details['date'] == now ? 'Today' : item.details['date'])}, ${item.details['time']}, ${item.details['priority'] == 0 ? 'None' : (item.details['priority'] == 1 ? 'Low' : (item.details['priority'] == 2 ? 'Medium' : 'High'))}'
                                                    : '${(item.details['date'] == now ? 'Today' : item.details['date'])}, ${item.details['priority'] == 0 ? 'None' : (item.details['priority'] == 1 ? 'Low' : (item.details['priority'] == 2 ? 'Medium' : 'High'))}')
                                                : '${item.details['priority'] == 0 ? 'None' : (item.details['priority'] == 1 ? 'Low' : (item.details['priority'] == 2 ? 'Medium' : 'High'))}',
                                            style: TextStyle(
                                                fontSize: ScreenUtil().setSp(12),
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
                            child: Text(item.list,
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
  // Widget detailsDialog(BuildContext context) {

  // }

  Widget _appBar(BuildContext context) {
    final item = Provider.of<ReminderProvider>(context);
    final AlertDialog errorDialog = AlertDialog(
      title: Text('Data is invalid'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK'),
        ),
      ],
    );
    int value;
    return AppBar(
      elevation: 0,
      leadingWidth: ScreenUtil().screenWidth / 5,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
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
      actions: [
        GestureDetector(
          child: GestureDetector(
            onTap: () => {
              if (item.title == null ||
                  item.notes == null ||
                  item.title == '' ||
                  item.notes == '')
                {
                  showDialog(
                      context: context, builder: (context) => errorDialog)
                }
              else
                {
                  RemindersList.addReminder(
                      item.title,
                      item.notes,
                      item.list,
                      item.details != null ? item.details['date'] : '',
                      item.details != null ? item.details['time'] : '',
                      item.details != null ? item.details['priority'] : 0),
                  // log(value.toString()+'***********'),
                  Navigator.pop(context)
                }
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
      ],
    );
  }
}
