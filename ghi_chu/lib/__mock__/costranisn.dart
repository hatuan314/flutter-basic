import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/home_Page/ProviderHomePage.dart';
import 'package:provider/provider.dart';

class constHomePage {
  List list;
  constHomePage(BuildContext context) {
    list = [
      {
        'icons': Icons.calendar_today,
        'title': 'To day',
        'push': RouteList.todayPage,
        'sum': Text(
          '${context.watch<providerhomePage>().leghttoday}',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(37)),
        )
      },
      {
        'icons': Icons.calendar_today,
        'title': 'Scheduled',
        'push': RouteList.scheduled,
        'sum': Text(
          '${context.watch<providerhomePage>().leghtSchedule}',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(37)),
        )
      },
      {
        'icons': Icons.all_inbox,
        'title': 'All',
        'push': RouteList.allPage,
        'sum': Text(
          '${context.watch<providerhomePage>().leghtAll}',
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(37)),
        )
      }
    ];
  }
}
