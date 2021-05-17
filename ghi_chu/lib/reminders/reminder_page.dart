

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/reminder.dart';

class RemindersPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<RemindersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding:  EdgeInsets.only(left: ScreenUtil().setWidth(10),bottom: ScreenUtil().setHeight(10)),
        child: Row(
          children: [
            Icon(Icons.add_circle,color: Colors.blue,),
            SizedBox(
              width: ScreenUtil().setWidth(6),
            ),
            Text('New Reminder',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: ScreenUtil().setSp(17)),)
          ],
        ),
      ),
      appBar: _appBar(context)
    );
  }
  Widget _appBar(BuildContext context){
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                size: ScreenUtil().setSp(20),
                color: Colors.blue,
              ),
              Text('Lists',style: TextStyle(color: Colors.blue,fontSize: ScreenUtil().setSp(12)),)
            ],
          ),
        )
    );
  }
}
