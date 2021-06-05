import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/common/enums/priority_type.dart';
import 'package:reminders_app/reminders_app/common/extensions/date_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminders_app/reminders_app/common/utils/priority_type_utils.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/bloc/reminder_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/widget/container_button_widget.dart';

import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/widget/list_dialog_item.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/widget/reminder_form_widget.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/details_screen.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminders_list.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/appbar.dart';
import 'bloc/reminder_state.dart';

class CreateNewReminder extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CreateNewReminder();
}

class _CreateNewReminder extends State<CreateNewReminder> {
  String title;
  String notes;
  DateTime date;
  String time;
  var details;

  String now = DateTime.now().dateDdMMyyyy;
  ReminderStream reminderStream = ReminderStream();

  Widget _appBarWidget(AsyncSnapshot<ReminderState> snapshot) {
    return AppbarWidget(
      context,
      leadingText: 'Cancel',
      title: 'New Reminder',
      onTapAction: (snapshot.data == null ||
              snapshot.data.title == null ||
              snapshot.data.title == '')
          ? Container(
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
            )
          : GestureDetector(
              onTap: () => {
                RemindersList.addReminder(
                    snapshot.data.title,
                    snapshot.data.notes == null ? '' : snapshot.data.notes,
                    snapshot.data.list,
                    snapshot.data.details != null
                        ? snapshot.data.details['date'] +
                            snapshot.data.details['time']
                        : 0,
                    snapshot.data.details != null
                        ? snapshot.data.details['priority']
                        : 0),
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
    );
  }

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
                    return ListItemWidget(
                        onTap: () => {
                              reminderStream
                                  .setList(RemindersList.MyLists[index].name),
                              Navigator.pop(context)
                            },
                        bgIcon: RemindersList.MyLists[index].color,
                        name: RemindersList.MyLists[index].name,
                        length: RemindersList.MyLists[index].list.length);
                  }))
        ]);
    return StreamBuilder<ReminderState>(
        initialData: ReminderState(list: 'Reminders'),
        stream: reminderStream.reminderStream,
        builder: (context, snapshot) {
          return SafeArea(
            child: Scaffold(
              appBar: _appBarWidget(snapshot),
              body: ListView(
                shrinkWrap: true,
                children: [
                  ReminderFormWidget(
                      onChangeTitle: (value) => {
                            reminderStream.setTitle(value),
                            title = value,
                          },
                      onChangeNotes: (value) => {
                            reminderStream.setNote(value),
                            notes = value,
                          }),
                  ContainerButtonWidget(
                    title: 'Details',
                    content: snapshot.data.details != null ? getContent(snapshot.data.details) : null,
                    onPressed: () async {
                      details = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => details == null
                                  ? DetailsScreen(
                                  date: 0, time: 0, priority: 0)
                                  : DetailsScreen(
                                date: details['date'],
                                time: details['time'],
                                priority: details['priority'],
                              )));
                      reminderStream.setDetails(details);
                    },
                  ),
                  ContainerButtonWidget(
                    title: 'List',
                    subTitle: snapshot.data.list != null
                        ? snapshot.data.list
                        : 'Reminders',
                    onPressed: () => showDialog(
                        context: context, builder: (context) => listDialog),
                  ),
                ],
              ),
            ),
          );
        });
  }

  String getContent(content) {
    if (content['date'] != 0) {
      if (content['time'] != 0) {
        return '${DateTime.fromMillisecondsSinceEpoch(content['date']).isToday},'
            ' ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(content['date'] + content['time']))},'
            ' ${getPriorityTypeText(content['priority'])}';
      } else {
        return '${DateTime.fromMillisecondsSinceEpoch(content['date']).isToday},'
            ' ${getPriorityTypeText(content['priority'])}';
      }
    } else {
      return '${getPriorityTypeText(content['priority'])}';
    }
  }

  String getPriorityTypeText(int intPriority) {
    switch (intPriority) {
      case 1:
        return priorityTypeUtil(PriorityType.LOW);
      case 2:
        return priorityTypeUtil(PriorityType.MEDIUM);
      case 3:
        return priorityTypeUtil(PriorityType.HIGH);
      default:
        return priorityTypeUtil(PriorityType.NONE);
    }
  }
}
