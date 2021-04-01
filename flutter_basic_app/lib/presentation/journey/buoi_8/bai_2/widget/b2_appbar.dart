import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget b2Appbar()
{
  return AppBar(
    backgroundColor: Colors.black,
    automaticallyImplyLeading: true,
    title: Text(
      'Bài viết',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w700,
        fontSize: ScreenUtil().setSp(25),
      ),
    ),
  );
}