import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget textField(String hintText, int maxLine, Function onChanged)
{
  return   TextField(
    maxLines: maxLine,
    textCapitalization: TextCapitalization.sentences,
    textAlign: TextAlign.start,
    onChanged: onChanged,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
          fontSize: ScreenUtil().setSp(15),
          fontFamily: 'MS',
          fontWeight: FontWeight.w500,
          color: Colors.grey),
      // enabled: false,
       border:( hintText=='Notes') ? InputBorder.none:UnderlineInputBorder(),
    ),
  );
}