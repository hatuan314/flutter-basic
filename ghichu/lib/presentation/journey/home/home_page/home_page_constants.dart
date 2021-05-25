import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/common/constants/route_constants.dart';

class HomePageConstants {
  static List list=[
    {
      'icons': Icons.calendar_today,
      'title': 'Today',
      'push': RouteList.todayPage,
      'colors':Colors.blue,
      'sum': 0
    },
    {
      'icons': Icons.calendar_today,
      'title': 'Scheduled',
      'push': RouteList.scheduled,
      'colors':Colors.red,
      'sum': 0
    },
    {
      'icons': Icons.all_inbox,
      'title': 'All',
      'push': RouteList.allPage,
      'colors':Colors.deepPurple,
      'sum': 0
    }
  ];
  static double widthGroupText270=ScreenUtil().setWidth(270);
  static double widthContainer = ScreenUtil().setWidth(30);
  static double heightContainer = ScreenUtil().setHeight(110);
  static double paddingWidth10 = ScreenUtil().setWidth(10);
  static double paddingWidth15 = ScreenUtil().setWidth(15);
  static double paddingWidth20 = ScreenUtil().setWidth(19);
  static double paddingHeight20 = ScreenUtil().setHeight(20);
  static double paddingHeight10 = ScreenUtil().setHeight(10);
  static Radius radiusCircle15=Radius.circular(ScreenUtil().setSp(15));
  static Duration durationContainer=Duration(milliseconds: 180);
  static double screenUtileSp18=ScreenUtil().setSp(18);
  static double screenUtileSp20=ScreenUtil().setSp(20);
  static double screenUntilHeight60=ScreenUtil().setHeight(60);

}
