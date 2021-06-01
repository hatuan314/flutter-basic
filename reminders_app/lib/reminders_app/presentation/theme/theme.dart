import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class ThemeText {
  static TextStyle headlineListScreen = TextStyle(
      color: Colors.blue,
      fontSize: ScreenUtil().setSp(25),
      fontWeight: FontWeight.w700);
  static TextStyle headline2ListScreen = TextStyle(
      color: Colors.blue,
      fontSize: ScreenUtil().setSp(20),
      fontWeight: FontWeight.w700);
}
