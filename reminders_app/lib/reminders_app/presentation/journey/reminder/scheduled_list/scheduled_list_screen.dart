import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/reminders_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/scheduled_list/bloc/scheduled_list_state.dart';
import 'package:reminders_app/reminders_app/presentation/theme/theme.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/appbar_for_list_screen.dart';
import 'bloc/scheduled_list_stream.dart';
import '../../reminders_list.dart';
import 'package:reminders_app/reminders_app/common/extensions/date_extensions.dart';

class ScheduledList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScheduledList();
}

class _ScheduledList extends State<ScheduledList> {
  int id;
  String now = DateTime.now().dateDdMMyyyy;
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
                appBar: AppbarWidgetForListScreen(context),
                body:
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(10),
                        left: ScreenUtil().setWidth(20)),
                    child: Text(
                      RemindersConstants.scheduledTxt,
                      style: ThemeText.headlineListScreen.copyWith(color: Colors.red),
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
                          child: RemindersConstants.noReminders
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
                                            style: ThemeText.headline2ListScreen
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
                                            String time = DateTime.fromMillisecondsSinceEpoch(snapshot
                                                .data.scheduledList[snapshot
                                                .data.dateList[index]][index1]
                                                .dateAndTime).hourHHmm;
                                            String date = DateTime.fromMillisecondsSinceEpoch(snapshot
                                                .data.scheduledList[snapshot
                                                .data.dateList[index]][index1]
                                                .dateAndTime).dateDdMMyyyy;
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
                                                              color: RemindersConstants.getPriorityColor(snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].priority),   ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                            EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    width:ScreenUtil().screenWidth-75,
                                                                    child: Text(
                                                                    snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].title,
                                                                      overflow: TextOverflow.ellipsis,
                                                                      maxLines: 5,
                                                                      softWrap: false,
                                                                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black, fontSize: ScreenUtil().setSp(17)),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(3)),
                                                                    child: Container(
                                                                      width:ScreenUtil().screenWidth-75,
                                                                      child: Text(
                                                                        (snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].dateAndTime % 10 == 1) ? '${time} \n${snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].notes}' : '${snapshot.data.scheduledList[snapshot.data.dateList[index]][index1].notes}',
                                                                        overflow: TextOverflow.ellipsis,
                                                                        maxLines: 5,
                                                                        softWrap: false,
                                                                        style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey, fontSize: ScreenUtil().setSp(12)),
                                                                      ),
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
