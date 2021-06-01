import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/list/bloc/list_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/reminders_constants.dart';
import 'package:reminders_app/reminders_app/presentation/model/reminder.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/appbar_for_list_screen.dart';
import '../../reminders_list.dart';

import 'package:reminders_app/reminders_app/common/extensions/date_extensions.dart';

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
          return SafeArea(
              child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppbarWidgetForListScreen(context),
                  body: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                        listStream.list.length != 0
                            ? listWidget(index, context)
                            : Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().screenHeight / 2 - 100),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: RemindersConstants.noReminders),
                              )
                      ])));
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
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: RemindersList.MyLists[index].list.length,
                itemBuilder: (context, index1) {
                  String time = DateFormat('HH:mm').format(
                      DateTime.fromMillisecondsSinceEpoch(RemindersList
                          .MyLists[index].list[index1].dateAndTime));
                  String date = DateFormat('dd/MM/yyyy').format(
                      DateTime.fromMillisecondsSinceEpoch(RemindersList
                          .MyLists[index].list[index1].dateAndTime));
                  return Slidable(
                      closeOnScroll: true,
                      actionPane: SlidableDrawerActionPane(),
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
                                            String delDate;
                                            id = RemindersList
                                                .MyLists[index].list[index1].id;
                                            RemindersList.MyLists[index].list
                                                .removeAt(index1);

                                            RemindersList.allReminders
                                                .forEach((key, value) {
                                              for (int i = 0;
                                                  i < value.length;
                                                  i++) {
                                                if (value[i].id == id) {
                                                  value.removeAt(i);
                                                  i--;
                                                }
                                                if (RemindersList
                                                        .allReminders[key]
                                                        .length ==
                                                    0) {
                                                  delDate = key;
                                                }
                                              }
                                            });
                                            RemindersList.allReminders
                                                .remove(delDate);
                                            index1--;
                                            listStream.update(index);
                                            Navigator.pop(context);
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
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
                                         width:ScreenUtil().screenWidth-75,
                                            child: Text(
                                                RemindersList.MyLists[index]
                                                    .list[index1].title,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 5,
                                                softWrap: false,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                    fontSize: ScreenUtil().setSp(17)),

                                          ),
                                        ),

                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(3)),
                                          child: Container(
                                            width: ScreenUtil().screenWidth-75,
                                            child: Text(
                                              RemindersList
                                                          .MyLists[index]
                                                          .list[index1]
                                                          .dateAndTime !=
                                                      0
                                                  ? ((RemindersList
                                                                  .MyLists[index]
                                                                  .list[index1]
                                                                  .dateAndTime %
                                                              10 ==
                                                          1)
                                                      ? '${date == now ? 'Today' : date}, ${time} \n${RemindersList.MyLists[index].list[index1].notes}'
                                                      : '${date == now ? 'Today' : date}\n${RemindersList.MyLists[index].list[index1].notes}')
                                                  : '${RemindersList.MyLists[index].list[index1].notes}',
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
                                          width: ScreenUtil().screenWidth - 75,
                                        )
                                      ]),
                                )
                              ])));
                })));
  }
}
