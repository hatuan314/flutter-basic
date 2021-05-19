import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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