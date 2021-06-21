import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/common/constants/color_constants.dart';
import 'package:reminders_app/reminders_app/domain/entities/reminder.dart';
import 'package:reminders_app/reminders_app/theme/theme.dart';
import '../../../../../common/constants/route_constants.dart';
import 'bloc/list_stream.dart';
import '../../reminder/reminders_constants.dart';
import '../../../../widgets_constants/appbar_for_list_screen.dart';
import '../../../../widgets_constants/confirm_dialog.dart';
import '../../../../widgets_constants/icon_slide_widget.dart';
import '../../reminders_list.dart';

import '../../../../../common/extensions/date_extensions.dart';

class ListScreen extends StatefulWidget {
  int index;

  ListScreen(this.index);

  @override
  State<StatefulWidget> createState() => _ListScreen(this.index);
}

class _ListScreen extends State<ListScreen> {
  _ListScreen(this.index);

  int index;
  int id;
  String now = DateTime.now().dateDdMMyyyy;

  @override
  void dispose() {
    listStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    listStream.update(index);
    return StreamBuilder<List<Reminder>>(
        stream: listStream.listStream,
        builder: (context, snapshot) {
          return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppbarWidgetForListScreen(context, () {
                Navigator.pushNamed(context, RouteList.createNewScreen)
                    .whenComplete(() async => await listStream.update(index));
              }),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(10),
                          left: ScreenUtil().setWidth(20)),
                      child: Text(
                        RemindersList.MyLists[index].name,
                        style: ThemeText.headlineListScreen.copyWith(
                          color:ColorConstants.colorMap[ RemindersList.MyLists[index].color],
                        ),
                      ),
                    ),
                    listStream.list.length != 0
                        ? listWidget(index, context)
                        : Padding(
                            padding: EdgeInsets.only(
                                top: ScreenUtil().screenHeight / 2 - 100),
                            child: Align(
                                alignment: Alignment.center,
                                child: RemindersConstants.noReminders),
                          )
                  ]));
        });
  }

  ListStream listStream = ListStream();

  Widget listWidget(int index, BuildContext context) {
    return Expanded(
        child: Padding(
            padding: EdgeInsets.only(
              bottom: ScreenUtil().setHeight(12),
              right: ScreenUtil().setWidth(12),
              left: ScreenUtil().setWidth(20),
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: RemindersList.MyLists[index].list.length,
                itemBuilder: (context, index1) {
                  String time = DateTime.fromMillisecondsSinceEpoch(
                          RemindersList.MyLists[index].list[index1].dateAndTime)
                      .hourHHmm;
                  String date = DateTime.fromMillisecondsSinceEpoch(
                          RemindersList.MyLists[index].list[index1].dateAndTime)
                      .dateDdMMyyyy;
                  return Slidable(
                      closeOnScroll: true,
                      actionPane: SlidableDrawerActionPane(),
                      secondaryActions: [
                        IconSlideWidget.edit(),
                        IconSlideWidget.delete(
                          () => {
                            log('aaaaa'),
                            showDialog(
                              context: context,
                              builder: (_) => ConfirmDialog(      confirmText: 'Delete',
                                content:
                                    'Are you sure you want to delete this reminder ?',
                                title: 'Delete ?',
                                onPressedCancel: () {
                                  Navigator.pop(context);
                                },
                                onPressedOk: () => deleteReminder(index1),
                              ),
                            )
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
                                        RemindersList.MyLists[index]
                                            .list[index1].priority),
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
                                              RemindersList.MyLists[index]
                                                  .list[index1].title,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 5,
                                              softWrap: false,
                                              style: ThemeText.title),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(3)),
                                          child: Container(
                                            width:
                                                ScreenUtil().screenWidth - 85,
                                            child: Text(
                                                getDetails(index1, date, time),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                                softWrap: false,
                                                style: ThemeText.subtitle),
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

  deleteReminder(int index1) {
    String delDate;
    id = RemindersList.MyLists[index].list[index1].id;
    RemindersList.MyLists[index].list.removeAt(index1);
    RemindersList.allReminders.forEach((key, value) {
      for (int i = 0; i < value.length; i++) {
        if (value[i].id == id) {
          value.removeAt(i);
          i--;
        }
        if (RemindersList.allReminders[key].length == 0) {
          delDate = key;
        }
      }
    });
    RemindersList.allReminders.remove(delDate);
    index1--;
    listStream.update(index);
    Navigator.pop(context);
  }

  String getDetails(int index1, String date, String time) {
    return RemindersList.MyLists[index].list[index1].dateAndTime != 0
        ? ((RemindersList.MyLists[index].list[index1].dateAndTime % 10 == 1)
            ? '${date == now ? 'Today' : date}, ${time} \n${RemindersList.MyLists[index].list[index1].notes}'
            : '${date == now ? 'Today' : date}\n${RemindersList.MyLists[index].list[index1].notes}')
        : '${RemindersList.MyLists[index].list[index1].notes}';
  }
}
