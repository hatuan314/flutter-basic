import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/home_Page/ProviderHomePage.dart';
import 'package:ghi_chu/home_Page/Widget/WrapWidget.dart';
import 'package:ghi_chu/home_Page/Widget/editHomePage.dart';
import 'package:ghi_chu/model/reminder.dart';

import 'Widget/RemindersWidget.dart';
import 'Widget/ScheduledWidget.dart';
import 'Widget/Search.dart';
import 'Widget/TodayWidget.dart';
import 'package:provider/provider.dart';

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
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(15), 0,
            ScreenUtil().setWidth(15), ScreenUtil().setHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, RouteList.newReminder)
                    .whenComplete(() {
                  for (int i = 0; i < 3; i++) {
                    if (constHomePage.list[i]['title'] == 'To day') {
                      constHomePage.list[i]['sum'] = reminder.todaylist.length;
                    } else if (constHomePage.list[i]['title'] == 'Scheduled') {
                      constHomePage.list[i]['sum'] =
                          reminder.Scheduletest.length;
                    } else if (constHomePage.list[i]['title'] == 'All') {
                      constHomePage.list[i]['sum'] = reminder.listAll.length;
                    }
                  }
                  setState(() {});
                  context.read<providerhomePage>().update();
                });
              },
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(6),
                    ),
                    Text(
                      'New Reminder',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(17)),
                    )
                  ],
                ),
              ),
            ),
            Text(
              'Add List',
              style: TextStyle(
                  color: Colors.blue, fontSize: ScreenUtil().setSp(18)),
            )
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
            child: Center(
                child: GestureDetector(
                  onTap: (){
                    context.read<providerhomePage>().setedit();
                  },
                  child: Text(
              context.watch<providerhomePage>().edit?'Edit':'Done',
              style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setHeight(18)),
            ),
                )),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            searchWidget(),
            AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
              width: ScreenUtil().screenWidth,
              height: context.watch<providerhomePage>().edit?ScreenUtil().setHeight(280):ScreenUtil().setHeight(220),
              color: Colors.transparent,
              child: Stack(
                children: [
                  wrapWidget(),
                  editWidget(),
                ],
              )
            ),
            SizedBox(
              height: ScreenUtil().setHeight(10),
            ),
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: Text(
                'My Lists',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(20)),
              ),
            ),
            remindersWidget()
          ],
        ),
      ),
    );
  }
}
