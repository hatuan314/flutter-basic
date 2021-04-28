import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/New_Reminder/ProviderReminder.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:provider/provider.dart';
import 'Widgets/Details_Widget.dart';
import 'Widgets/list_Reminders.dart';
import 'Widgets/title_Note.dart';

class newReminderPage extends StatefulWidget {
  @override
  _newReminderPageState createState() => _newReminderPageState();
}

class _newReminderPageState extends State<newReminderPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  DateTime nowdate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Center(
                child: Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(18)),
            )),
          ),
        ),
        leadingWidth: ScreenUtil().setWidth(100),
        centerTitle: true,
        title: Text(
          'New Reminder',
          style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(25),
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: context.watch<providerReminder>().butoon
                  ? () {
                      List data = providerReminder.getluestime as List;
                      reminder.listAll.add({
                        'title': titleController.text,
                        'note': noteController.text,
                        'time': data
                      });
                      try {
                        if (data[0]['date'].day == nowdate.day &&
                            nowdate.month == data[0]['date'].month &&
                            nowdate.year == data[0]['date'].year) {
                          reminder.todaylist.add({
                            'title': titleController.text,
                            'note': noteController.text,
                            'time': data
                          });
                        }
                      } catch (e) {}
                      Navigator.pop(context);
                    }
                  : null,
              child: Text(
                'Add',
                style: TextStyle(
                    color: context.watch<providerReminder>().butoon
                        ? Colors.blue
                        : Colors.black26,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(23)),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              titleNode(
                titleController: titleController,
                noteController: noteController,
              ),
              DetailsWidget(),
              listReminders()
            ],
          ),
        ),
      ),
    );
  }
}
