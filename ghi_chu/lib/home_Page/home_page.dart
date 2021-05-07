
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

  Widget gridViewItem(Icon icon, Color bgColor, String title, int count) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    // alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
                    ),
                    child: icon,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    '${count}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(25),
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
