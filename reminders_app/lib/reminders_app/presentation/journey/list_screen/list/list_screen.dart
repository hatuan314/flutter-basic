import 'package:flutter/material.dart';

import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list_screen/widget_constants/appbar.dart';

import '../../reminders_list.dart';

int id;
String now = DateTime.now().day.toString() +
    "/" +
    DateTime.now().month.toString() +
    "/" +
    DateTime.now().year.toString();

Widget listScreen(BuildContext context, int index) {
  return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: appBar(context),
          body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(10),
                  left: ScreenUtil().setWidth(20)),
              child: Text(
                RemindersList.MyLists[index].name,
                style: TextStyle(
                    color: RemindersList.MyLists[index].color,
                    fontSize: ScreenUtil().setSp(25),
                    fontWeight: FontWeight.w700),
              ),
            ),
             RemindersList.MyLists[index].list.length != 0
                ? listWidget(index, context)
                : Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().screenHeight / 2 - 100),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'No Reminders',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil().setSp(20)),
                      ),
                    ),
                  )
          ])));
}

Widget listWidget(int index, BuildContext context) {

  return Expanded(
      child: Padding(
          padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(12),
            right: ScreenUtil().setWidth(12),
            left: ScreenUtil().setWidth(20),
          ),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount:  RemindersList.MyLists[index].list.length,
              itemBuilder: (context, index1) {
                String time=DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(RemindersList.MyLists[index]
                    .list[index1].dateAndTime));
                String date=DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(RemindersList.MyLists[index]
                    .list[index1].dateAndTime));
                return
                  Container(
                        padding:
                            EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: ScreenUtil().setHeight(15),
                                height: ScreenUtil().setHeight(15),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (RemindersList.MyLists[index]
                                              .list[index1].priority ==
                                          3
                                      ? Colors.red
                                      : (RemindersList.MyLists[index]
                                                  .list[index1].priority ==
                                              1
                                          ? Colors.yellow
                                          : (RemindersList.MyLists[index]
                                                      .list[index1].priority ==
                                                  2
                                              ? Colors.orange
                                              : Colors.grey))),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    left: ScreenUtil().setWidth(20)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        RemindersList
                                            .MyLists[index].list[index1].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: ScreenUtil().setSp(17)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(3)),
                                        child: Text(
                                          RemindersList.MyLists[index]
                                                      .list[index1].dateAndTime !=
                                                  0
                                              ? (( RemindersList.MyLists[index]
                                              .list[index1].dateAndTime%10==1)
                                                  ? '${  date == now ? 'Today' :   date}, ${  time} \n${ RemindersList.MyLists[index].list[index1].notes}'
                                                  : '${  date == now ? 'Today' :   date}\n${ RemindersList.MyLists[index].list[index1].notes}')
                                              : '${ RemindersList.MyLists[index].list[index1].notes}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey,
                                              fontSize: ScreenUtil().setSp(12)),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(10)),
                                        color: Colors.grey,
                                        height: ScreenUtil().setHeight(0.5),
                                        width: ScreenUtil().screenWidth - 75,
                                      )
                                    ]),
                              )
                            ]));
              })));
}


