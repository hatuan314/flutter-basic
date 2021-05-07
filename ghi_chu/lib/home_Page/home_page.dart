
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/home_Page/ProviderHomePage.dart';

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
                child: Text(
              'Edit',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil().setHeight(18)),
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
            Wrap(
                spacing: 20,
                children: List.generate(3, (index) {
                  return index == 2
                      ? todayWidget(constHomePage(context).list[index])
                      : scheduledWidgets(constHomePage(context).list[index],
                          context.watch<providerhomePage>().leghtSchedule);
                })),
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
