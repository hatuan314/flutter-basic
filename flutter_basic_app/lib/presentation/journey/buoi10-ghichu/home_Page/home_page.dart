
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi10-ghichu/home_Page/Widget/RemindersWidget.dart';
import 'package:flutter_basic_app/presentation/journey/buoi10-ghichu/home_Page/Widget/ScheduledWidget.dart';
import 'package:flutter_basic_app/presentation/journey/buoi10-ghichu/home_Page/Widget/Search.dart';
import 'package:flutter_basic_app/presentation/journey/buoi10-ghichu/home_Page/Widget/TodayWidget.dart';
import 'package:flutter_basic_app/presentation/journey/buoi10-ghichu/home_Page/Widget/allWidgets.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/home_Page/Schedule_Page/Schedule_Page.dart';
import 'package:flutter_screenutil/screen_util.dart';
class homePagebuoi10 extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<homePagebuoi10> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(15), 0, ScreenUtil().setWidth(15), ScreenUtil().setHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RouteList.buoi10newReminder);
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(Icons.add_circle,color: Colors.blue,),
                    SizedBox(
                      width: ScreenUtil().setWidth(6),
                    ),
                    Text('New Reminder',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,fontSize: ScreenUtil().setSp(13)),)
                  ],
                ),
              ),
            ),
            Text('Add List',style: TextStyle(color: Colors.blue,fontSize: ScreenUtil().setSp(14)),)
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox(),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: Center(child: Text('Edit',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.w600,),)),
          )
        ],
      ),
      body: Padding(
        padding:EdgeInsets.fromLTRB(ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchWidget(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                todayWidget(),
               scheduledWidgets()
              ],
            ),
            allWidget(),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Padding(
              padding:  EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: Text('My Lists',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(20)),),
            ),
            remindersWidget()
          ],
        ),
      ),
    );
  }
}
