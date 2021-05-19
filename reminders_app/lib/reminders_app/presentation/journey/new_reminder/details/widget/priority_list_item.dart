import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget priorityListItem(String name, Color color, Function onTap, bool isNotLast)
{
  return Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
            margin: EdgeInsets.all(ScreenUtil().setHeight(15)),
            child: Row(children: [
              Expanded(
                flex: 20,
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(15),
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: ScreenUtil().setHeight(10),
                  width: ScreenUtil().setHeight(10),
                  decoration: BoxDecoration(
                      color: color,
                      shape: BoxShape.circle
                  ),
                ),
              )
            ])),
      ),
      Visibility(
        visible: isNotLast,
        child: Container(
            height: ScreenUtil().setHeight(0.2),
            width: ScreenUtil().screenWidth-50,
            color: Colors.black),
      ),
    ],
  );
}
