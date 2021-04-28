import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/create_new_reminder.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminder.dart';
import 'package:flutter_screenutil/screen_util.dart';

class B10HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    log(context.watch<Reminder>().allReminder.length.toString());
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            searchBar(),
            GridView(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(20),
                  left: ScreenUtil().setWidth(10),
                  right: ScreenUtil().setWidth(10),
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ScreenUtil().setWidth(10),
                  childAspectRatio: 2.2,
                ),
                children: [
                  gridViewItem(
                      Icon(
                        Icons.today,
                        size: ScreenUtil().setSp(22),
                        color: Colors.white,
                      ),
                      Colors.blue,
                      'Today',
                      context.watch<Reminder>().l1),
                  gridViewItem(
                      Icon(
                        Icons.calendar_today_sharp,
                        size: ScreenUtil().setSp(22),
                        color: Colors.white,
                      ),
                      Colors.red,
                      'Scheduled',
                      context.watch<Reminder>().l2),
                ]),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(15),
                left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
                bottom: ScreenUtil().setHeight(10),
              ),
              child: gridViewItem(
                  Icon(
                    Icons.format_align_left,
                    size: ScreenUtil().setSp(22),
                    color: Colors.white,
                  ),
                  Colors.grey,
                  'All',
                  context.watch<Reminder>().l3),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(10),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Lists',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10),
                left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
                bottom: ScreenUtil().setHeight(5),
              ),
              child: Container(
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
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
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.list,
                            size: ScreenUtil().setSp(22),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 22,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Reminders',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.black,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          '${context.watch<Reminder>().allReminder.length}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        )),
                    Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: ScreenUtil().setSp(15),
                          color: Colors.grey,
                        )),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: bottomBar(context),
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

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(30),
          bottom: ScreenUtil().setHeight(15),
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20)),
      child: Container(
        height: ScreenUtil().setHeight(29),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        padding: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(3),
          top: ScreenUtil().setHeight(3),
          left: ScreenUtil().setWidth(10),
        ),
        child: TextField(
            decoration: InputDecoration(
                // fillColor: Colors.blue,
                enabled: false,
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  size: ScreenUtil().setSp(25),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(15),
                ))),
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                  onTap: () async
                  { await Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            MultiProvider(
                              providers: [
                                ChangeNotifierProvider(
                                  create: (context) => Reminder(),
                                )
                              ],
                              child: CreateNewReminder(),
                            ),
                        //    fullscreenDialog: true,
                      )
                  ).whenComplete(()=> context.read<Reminder>().update() );

                  },
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(2)),
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: ScreenUtil().setSp(20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                      child: Text(
                        'New Reminder',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.blue),
                      ),
                    )
                  ]))),
          Expanded(
              child: GestureDetector(
            child: Text(
              'Add List',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: ScreenUtil().setSp(15),
                  color: Colors.blue),
            ),
          ))
        ],
      ),
    );
  }
}
