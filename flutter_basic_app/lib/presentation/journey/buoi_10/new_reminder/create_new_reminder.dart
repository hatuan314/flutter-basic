import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/home_page/homepage_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminder_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewReminder extends StatelessWidget {
  String title;
  String notes;
  DateTime date;
  String time;
  var details;
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ReminderProvider>(context, listen: false);
    final SimpleDialog listDialog = SimpleDialog(
        contentPadding: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(10),
          top: ScreenUtil().setHeight(10),
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20),
        ),
        title: Text(
          'List',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(15),
              fontWeight: FontWeight.w700,
              color: Colors.black),
        ),
        children: [
          Container(
              height: ScreenUtil().screenWidth - 20,
              width: ScreenUtil().screenWidth - 20,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: RemindersList.MyList.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => {
                        item.setList(RemindersList.MyList[index]['name']),
                        Navigator.pop(context)
                      },
                      child: Container(
                        margin: EdgeInsets.all(ScreenUtil().setHeight(10)),
                        child: Text(
                          RemindersList.MyList[index]['name'],
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    );
                  }))
        ]);
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: Column(
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
                      child: Row(
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
              RemindersList().addReminder(
                  item.title,
                  item.notes,
                  item.list,
                  item.details != null ? item.details['date'] : '',
                  item.details != null ? item.details['time'] : '',
                  item.details != null ? item.details['priority'] : ''),
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
        ),
      ],
    );
  }
}
