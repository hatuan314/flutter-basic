import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi10-ghichu/New_Reminder/Widgets/title_Note.dart';
import 'package:flutter_screenutil/screen_util.dart';

class newReminderPage extends StatefulWidget {
  @override
  _newReminderPageState createState() => _newReminderPageState();
}

class _newReminderPageState extends State<newReminderPage> {
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
                  fontSize: ScreenUtil().setSp(14)),
            )),
          ),
        ),
        centerTitle: true,
        title: Text(
          'New Reminder',
          style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(17),
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Center(
            child: Text(
              'Add',
              style:
                  TextStyle(color: Colors.black26, fontWeight: FontWeight.w600),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          )
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
        child: Column(
          children: [titleNode()],
        ),
      ),
    );
  }
}
