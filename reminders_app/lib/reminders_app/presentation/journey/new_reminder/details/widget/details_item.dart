import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

Widget detailsItem(String title, String subtitle, IconData icon, Color bgIcon, bool switchValue, Function switchOnChanged)
{
  return  ListTile(
    title: Text(
      title,
      style: TextStyle(
          fontSize: ScreenUtil().setSp(17),
          fontWeight: FontWeight.w500,
          color: Colors.black),
    ),
    subtitle: Text(
     subtitle,
       style: TextStyle(
          fontSize: ScreenUtil().setSp(12),
          fontWeight: FontWeight.w400,
          color: Colors.blue),
    ),
    leading: Container(
      padding: EdgeInsets.all(ScreenUtil().setHeight(4)),
      decoration: BoxDecoration(
          color: bgIcon,
          borderRadius: BorderRadius.circular(10)),
      child: Icon(
        icon,
        size: ScreenUtil().setSp(22),
        color: Colors.white,
      ),
    ),
    trailing: CupertinoSwitch(
      value: switchValue,
      onChanged: switchOnChanged
    ),
  );
}