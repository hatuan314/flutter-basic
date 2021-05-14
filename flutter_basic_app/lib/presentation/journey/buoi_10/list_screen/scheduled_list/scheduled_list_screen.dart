import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/scheduled_list/scheduled_list_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduledList extends StatelessWidget {
  int id;
  String now =  DateTime.now().day<10?'0'+DateTime.now().day.toString():DateTime.now().day.toString() + "/" +(DateTime.now().month<10?'0'+DateTime.now().month.toString():DateTime.now().month.toString()) + "/" +
      DateTime.now().year.toString();
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ScheduledProvider>(context);
    item.setDefault();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: _appBar(context),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(10),
                        left: ScreenUtil().setWidth(20)),
                    child: Text(
                      'Scheduled',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  item.dateList.length == 0
                      ? Padding(
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
                      : Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(12),
                                right: ScreenUtil().setWidth(12),
                                left: ScreenUtil().setWidth(20),
                              ),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: item.dateList.length,
                                  itemBuilder: (context, index) {
                                    return Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenUtil().setHeight(10),
                                            left: ScreenUtil().setWidth(20)),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            item.dateList[index] == now
                                                ? 'Today'
                                                : item.dateList[index],
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontSize:
                                                    ScreenUtil().setSp(20),
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: item
                                              .scheduledList[
                                                  item.dateList[index]]
                                              .length,
                                          itemBuilder: (context, index1) {
                                            String time=DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(item.scheduledList[item.dateList[ index]][index1].dateAndTime));
                                            String date=DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(item.scheduledList[item.dateList[ index]][index1].dateAndTime));
                                            //  log(index1.toString()+'}}}}}}}}}}}}');
                                            return Slidable(
                                                actionPane:
                                                    SlidableDrawerActionPane(),
                                                secondaryActions: [
                                                  IconSlideAction(
                                                    caption: 'Edit',
                                                    iconWidget: Icon(
                                                      Icons.edit,
                                                      color: Colors.white,
                                                    ),
                                                    color: Colors.blue,
                                                    onTap: () => {},
                                                  ),
                                                  IconSlideAction(
                                                      caption: 'Delete',
                                                      iconWidget: Icon(
                                                        Icons.delete,
                                                        color: Colors.white,
                                                      ),
                                                      color: Colors.red,
                                                      onTap: () => {
                                                        showDialog(context: context, builder: (_)=>AlertDialog(
                                                          title:Text('Delete ?'),
                                                          actions: [
                                                            FlatButton(
                                                              onPressed: () {Navigator.pop(context);},
                                                              child: Text('Cancel'),
                                                            ),
                                                            FlatButton(
                                                              onPressed: () {

                                                                id = item.scheduledList[item.dateList[ index]][index1].id;
                                                                RemindersList.allReminders[item.dateList[index]].removeAt(index1);
                                                                if(RemindersList.allReminders[item.dateList[index]].length==0)
                                                                {
                                                                RemindersList.allReminders.remove(item.dateList[index]);
                                                                };
                                                                for (int i = 0; i <RemindersList.MyLists.length;i++)
                                                                {
                                                                for (int j = 0; j <RemindersList.MyLists[i] .list.length;j++)
                                                                {
                                                                if (RemindersList.MyLists[i].list[j].id ==id)
                                                                {
                                                                RemindersList.MyLists[i].list.removeAt(j);
                                                                j--;

                                                                }
                                                                };
                                                                };
                                                                index1--;
                                                                item.update();
                                                                Navigator.pop(context);},
                                                              child: Text('OK'),
                                                            ),
                                                          ],
                                                        )),

                                                              }
                                                          )
                                                ],
                                                actionExtentRatio: 0.2,
                                                child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: ScreenUtil()
                                                            .setHeight(10)),
                                                    child: Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: ScreenUtil()
                                                                .setHeight(15),
                                                            height: ScreenUtil()
                                                                .setHeight(15),
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: (item
                                                                          .scheduledList[
                                                                              item.dateList[index]]
                                                                              [
                                                                              index1]
                                                                          .priority ==
                                                                      3
                                                                  ? Colors.red
                                                                  : (item.scheduledList[item.dateList[index]][index1].priority ==
                                                                          1
                                                                      ? Colors
                                                                          .yellow
                                                                      : (item.scheduledList[item.dateList[index]][index1].priority ==
                                                                              2
                                                                          ? Colors
                                                                              .orange
                                                                          : Colors
                                                                              .grey))),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets.only(
                                                                left: ScreenUtil()
                                                                    .setWidth(
                                                                        20)),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    item
                                                                        .scheduledList[
                                                                            item.dateList[index]]
                                                                            [
                                                                            index1]
                                                                        .title,
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize:
                                                                            ScreenUtil().setSp(17)),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: ScreenUtil()
                                                                            .setHeight(3)),
                                                                    child: Text(
                                                                       (item
                                                                           .scheduledList[
                                                                       item.dateList[index]]
                                                                       [
                                                                       index1].dateAndTime%10==1)
                                                                          ? '${ time} \n${item.scheduledList[item.dateList[index]][index1].notes}'
                                                                          : '${item.scheduledList[item.dateList[index]][index1].notes}',
                                                                      style: TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color: Colors
                                                                              .grey,
                                                                          fontSize:
                                                                              ScreenUtil().setSp(12)),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.only(
                                                                        top: ScreenUtil()
                                                                            .setHeight(10)),
                                                                    color: Colors
                                                                        .grey,
                                                                    height: ScreenUtil()
                                                                        .setHeight(
                                                                            0.5),
                                                                    width: ScreenUtil()
                                                                            .screenWidth -
                                                                        75,
                                                                  )
                                                                ]),
                                                          )
                                                        ])));
                                          })
                                    ]);
                                  }))),
                ])));
  }


  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: ScreenUtil().setSp(22),
          color: Colors.blue,
        ),
      ),
      title: Text(
        'Lists',
        style: TextStyle(color: Colors.blue, fontSize: ScreenUtil().setSp(20)),
      ),
      actions: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, RouteList.createNewScreen),
          child: Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(2)),
            margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: ScreenUtil().setSp(30),
            ),
          ),
        )
      ],
    );
  }
}
