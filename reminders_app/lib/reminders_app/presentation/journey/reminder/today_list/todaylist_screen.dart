import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/theme/theme.dart';
import '../../../../../common/constants/route_constants.dart';
import '../reminders_constants.dart';
import '../../../../widgets_constants/appbar.dart';
import '../../../../../common/extensions/date_extensions.dart';
import '../../../../widgets_constants/appbar_for_list_screen.dart';
import '../../../../widgets_constants/confirm_dialog.dart';
import '../../../../widgets_constants/icon_slide_widget.dart';
import 'bloc/today_list_stream.dart';
import '../../reminders_list.dart';

class TodayList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodayList();
}

class _TodayList extends State<TodayList> {
  String now = DateTime.now().dateDdMMyyyy;
  TodayStream todayStream = TodayStream();
  @override
  void dispose() {
    todayStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
      initialData: todayStream.todayList=RemindersList.allReminders[now],
        stream: todayStream.todayListStream,
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppbarWidgetForListScreen(
                context,
                () {
                  Navigator.pushNamed(context, RouteList.createNewScreen)
                      .whenComplete(() async =>await todayStream.update());
                },
              ),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(10),
                          left: ScreenUtil().setWidth(20)),
                      child: Text(
                        RemindersConstants.todayTxt,
                        style: ThemeText.headlineListScreen,
                      ),
                    ),
                    (snapshot.hasData == false ||
                            todayStream.todayList.length == 0)
                        ? Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil().screenHeight / 2 - 100),
                            child: Align(
                                alignment: Alignment.center,
                                child: RemindersConstants.noReminders),
                          )
                        : todayListWidget(context)
                  ]));
        });
  }

  Widget todayListWidget(
    BuildContext context,
  ) {
    //todayStream.update();
    int id;
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
                itemCount: todayStream
                    .todayList.length, // todayStream.todayList.length,
                itemBuilder: (context, index) {
                  String time = DateFormat('HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          todayStream.todayList[index].dateAndTime));
                  String date = DateFormat('dd/MM/yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(
                          todayStream.todayList[index].dateAndTime));
                  return Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: [
                        IconSlideWidget.edit(),
                        IconSlideWidget.delete(
                          () => {
                            showDialog(
                                context: context,
                                builder: (_) => ConfirmDialog(
                                  confirmText: 'Delete',
                                      content:
                                          'Are you sure you want to delete this reminder ?',
                                      title: 'Delete ?',
                                      onPressedCancel: () {
                                        Navigator.pop(context);
                                      },
                                      onPressedOk: () => deleteReminder(
                                          context, todayStream, now, index),
                                    )),
                          },
                        )
                      ],
                      actionExtentRatio: 0.2,
                      child: Container(
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
                                    color: RemindersConstants.getPriorityColor(
                                        RemindersList
                                            .allReminders[now][index].priority),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: ScreenUtil().setWidth(20)),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: ScreenUtil().screenWidth - 85,
                                          child: Text(
                                            RemindersList
                                                .allReminders[now][index].title,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 5,
                                            softWrap: false,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                                fontSize:
                                                    ScreenUtil().setSp(17)),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(3)),
                                          child: Container(
                                            width:
                                                ScreenUtil().screenWidth - 85,
                                            child: Text(
                                              (RemindersList
                                                              .allReminders[now]
                                                                  [index]
                                                              .dateAndTime %
                                                          10 ==
                                                      1)
                                                  ? '${time} \n${RemindersList.allReminders[now][index].notes}'
                                                  : '${RemindersList.allReminders[now][index].notes}',
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,
                                              softWrap: false,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey,
                                                  fontSize:
                                                      ScreenUtil().setSp(12)),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(10)),
                                          color: Colors.grey,
                                          height: ScreenUtil().setHeight(0.5),
                                          width: ScreenUtil().screenWidth - 85,
                                        )
                                      ]),
                                )
                              ])));
                })));
  }

  void deleteReminder(
      BuildContext context, TodayStream todayStream, String now, int index) {
    int id = todayStream.todayList[index].id;
    RemindersList.allReminders[now].removeAt(index);
    if (RemindersList.allReminders[now].length == 0) {
      log('deletenow');
      RemindersList.allReminders.remove(now);
    }
    for (int i = 0; i < RemindersList.MyLists.length; i++)
      for (int j = 0; j < RemindersList.MyLists[i].list.length; j++)
        if (RemindersList.MyLists[i].list[j].id == id) {
          RemindersList.MyLists[i].list.removeAt(j);
          j--;
        }
    index--;
    todayStream.update();
    Navigator.pop(context);
  }
}
