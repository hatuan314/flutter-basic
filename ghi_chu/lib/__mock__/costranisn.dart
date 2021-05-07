import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/home_Page/ProviderHomePage.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:provider/provider.dart';

class constHomePage {
 static List list=[
    {
      'icons': Icons.calendar_today,
      'title': 'To day',
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
}
