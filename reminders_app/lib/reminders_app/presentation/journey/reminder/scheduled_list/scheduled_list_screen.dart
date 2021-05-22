import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/scheduled_list/bloc/scheduled_list_state.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/widget_constants/appbar.dart';
import 'bloc/scheduled_list_stream.dart';
import '../../reminders_list.dart';

class ScheduledList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScheduledList();
}

class _ScheduledList extends State<ScheduledList> {
  int id;
  String now = DateTime.now().day < 10
      ? '0' + DateTime.now().day.toString()
      : DateTime.now().day.toString() +
          "/" +
          (DateTime.now().month < 10
              ? '0' + DateTime.now().month.toString()
              : DateTime.now().month.toString()) +
          "/" +
          DateTime.now().year.toString();
  ScheduledListStream scheduledListStream = ScheduledListStream();
  @override
  void dispose() {
    scheduledListStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scheduledListStream.setDefault();
    return StreamBuilder<ScheduledListState>(
      initialData: ScheduledListState(dateList: scheduledListStream.dateList,scheduledList: scheduledListStream.scheduledList),
      stream: scheduledListStream.scheduledStream,
      builder: (context, snapshot) {
        return SafeArea(
            child: Scaffold(
                backgroundColor: Colors.white,
                appBar: appBar(context),
                body:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                      (snapshot.hasData == false ||
                          snapshot.data.dateList.length== 0)
                          ? Padding(
                        padding: EdgeInsets.only(
                            top: ScreenUtil().screenHeight / 2 -
                                100),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'No Reminders',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize:
                                ScreenUtil().setSp(20)),
                          ),
                        ),
                      )
                          : Expanded(
                          child: Padding(
                              padding: EdgeInsets.only(
                                bottom:
                                ScreenUtil().setHeight(12),
                                right: ScreenUtil().setWidth(12),
                                left: ScreenUtil().setWidth(20),
                              ),
                              child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.dateList.length,
                                  itemBuilder: (context, index) {
                                    return Column(children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenUtil()
                                                .setHeight(10),
                                            left: ScreenUtil()
                                                .setWidth(20)),
                                        child: Align(
                                          alignment: Alignment
                                              .centerLeft,
                                          child: Text(
                                            snapshot.data.dateList[
                                            index] ==
                                                now
                                                ? 'Today'
                                                : snapshot
                                                .data.dateList[index],
                                            style: TextStyle(
                                                color:
                                                Colors.blue,
                                                fontSize:
                                                ScreenUtil()
                                                    .setSp(
                                                    20),
                                                fontWeight:
                                                FontWeight
                                                    .w700),
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                          scrollDirection:
                                          Axis.vertical,
                                          shrinkWrap: true,
                                          itemCount: snapshot
                                              .data.scheduledList[snapshot
                                              .data.dateList[index]]
                                              .length,
                                          itemBuilder:
                                              (context, index1) {
                                            String time = DateFormat(
                                                'HH:mm')
                                                .format(DateTime.fromMillisecondsSinceEpoch(snapshot
                                                .data.scheduledList[snapshot
                                                .data.dateList[index]][index1]
                                                .dateAndTime));
                                            String date = DateFormat(
                                                'dd/MM/yyyy')
                                                .format(DateTime.fromMillisecondsSinceEpoch(snapshot
                                                .data.scheduledList[snapshot
                                                .data.dateList[index]][index1]
                                                .dateAndTime));
                                            //  log(index1.toString()+'}}}}}}}}}}}}');
                                            return Slidable(
                                                actionPane:
                                                SlidableDrawerActionPane(),
                                                secondaryActions: [
                                                  IconSlideAction(
                                                    caption:
                                                    'Edit',
                                                    iconWidget:
                                                    Icon(
                                                      Icons.edit,
                                                      color: Colors
                                                          .white,
                                                    ),
                                                    color: Colors
                                                        .blue,
                                                    onTap: () =>
                                                    {},
                                                  ),
                                                  IconSlideAction(
                                                      caption:
                                                      'Delete',
                                                      iconWidget:
                                                      Icon(
                                                        Icons
                                                            .delete,
                                                        color: Colors
                                                            .white,
                                                      ),
                                                      color: Colors
                                                          .red,
                                                      onTap: () =>
                                                      {
                                                        showDialog(
                                                            context: context,
                                                            builder: (_) => AlertDialog(
                                                              title: Text('Delete ?'),
                                                              actions: [
                                                                FlatButton(
                                                                  onPressed: () {
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text('Cancel'),
                                                                ),
                                                                FlatButton(
                                                                  onPressed: () {
                                                                    id = snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].id;
                                                                    RemindersList.allReminders[snapshot.data.dateList[index]].removeAt(index1);
                                                                    if (RemindersList.allReminders[snapshot.data.dateList[index]].length == 0) {
                                                                      RemindersList.allReminders.remove(snapshot.data.dateList[index]);
                                                                    }
                                                                    ;
                                                                    for (int i = 0; i < RemindersList.MyLists.length; i++) {
                                                                      for (int j = 0; j < RemindersList.MyLists[i].list.length; j++) {
                                                                        if (RemindersList.MyLists[i].list[j].id == id) {
                                                                          RemindersList.MyLists[i].list.removeAt(j);
                                                                          j--;
                                                                        }
                                                                      }
                                                                      ;
                                                                    }
                                                                    ;
                                                                    index1--;
                                                                    scheduledListStream.update();
                                                                    Navigator.pop(context);
                                                                  },
                                                                  child: Text('OK'),
                                                                ),
                                                              ],
                                                            )),
                                                      })
                                                ],
                                                actionExtentRatio:
                                                0.2,
                                                child: Container(
                                                    padding: EdgeInsets.only(
                                                        top: ScreenUtil()
                                                            .setHeight(
                                                            10)),
                                                    child: Row(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Container(
                                                            width:
                                                            ScreenUtil().setHeight(15),
                                                            height:
                                                            ScreenUtil().setHeight(15),
                                                            decoration:
                                                            BoxDecoration(
                                                              shape:
                                                              BoxShape.circle,
                                                              color: (snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].priority == 3
                                                                  ? Colors.red
                                                                  : (snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].priority == 1 ? Colors.yellow : (snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].priority == 2 ? Colors.orange : Colors.grey))),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text(
                                                                  snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].title,
                                                                    style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: ScreenUtil().setSp(17)),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(3)),
                                                                    child: Text(
                                                                      (snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].dateAndTime % 10 == 1) ? '${time} \n${snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].notes}' : '${snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].notes}',
                                                                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: ScreenUtil().setSp(12)),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                                                                    color: Colors.grey,
                                                                    height: ScreenUtil().setHeight(0.5),
                                                                    width: ScreenUtil().screenWidth - 75,
                                                                  )
                                                                ]),
                                                          )
                                                        ])));
                                          })
                                    ]);
                                  }))),
                ])));
      }
    );
  }
}
