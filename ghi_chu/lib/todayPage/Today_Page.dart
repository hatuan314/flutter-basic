import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/reminder.dart';

class todayPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<todayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w900,
                  fontSize: ScreenUtil().setSp(30)),
            ),
            Column(
              children: List.generate(reminder.todaylist.length, (index) {
                List list = reminder.todaylist[index]['time'] as List;
                return Row(
                  children: [
                    Icon(
                      Icons.check_circle_outlined,
                      color: Colors.black54,
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(10),
                            top: ScreenUtil().setHeight(10)),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colors.black38, width: 0.2))),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${reminder.todaylist[index]['title']}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(15)),
                            ),
                            Visibility(
                                visible: reminder.listAll[index]['time'] == null
                                    ? false
                                    : true,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenUtil().setHeight(5),
                                    ),
                                    // Text('${list}',style: TextStyle(color: Colors.black87,fontSize: ScreenUtil().setSp(14)))
                                    Row(
                                      children: [
                                        Text(
                                          list == null
                                              ? ''
                                              : list[0]['time'] == ''
                                                  ? 'Reminders'
                                                  : 'Reminders - ${list[0]['time'][0]}:${list[0]['time'][1]}',
                                          style: TextStyle(
                                              color: Colors.black87.withOpacity(0.6),
                                              fontSize: ScreenUtil().setSp(17)),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                            Visibility(
                                visible: reminder.todaylist[index]['note'] == ''
                                    ? false
                                    : true,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: ScreenUtil().setHeight(5),
                                    ),
                                    Text('${reminder.todaylist[index]['note']}',
                                        style: TextStyle(
                                            color: Colors.black87.withOpacity(0.6),
                                            fontSize: ScreenUtil().setSp(14)))
                                  ],
                                ))
                          ],
                        ),
                      ),
                    )
                  ],
                );
              }),
            )
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                size: ScreenUtil().setSp(20),
                color: Colors.blue,
              ),
              Text(
                'Lists',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(12)),
              )
            ],
          ),
        ));
  }
}
