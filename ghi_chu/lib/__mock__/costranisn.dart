import 'package:flutter/material.dart';

import 'package:ghi_chu/common/constants/route_constants.dart';


class ConstHomePage {
  static List listColors=[Colors.red,Colors.deepOrangeAccent,Colors.yellow,Colors.green,Colors.blue,Colors.purple,Colors.brown];
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
}
