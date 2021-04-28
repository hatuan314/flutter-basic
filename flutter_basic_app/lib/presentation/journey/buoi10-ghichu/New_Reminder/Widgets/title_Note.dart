import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
class titleNode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      width: double.infinity,
      height: ScreenUtil().setHeight(150),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(40),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black,width: 0.2))
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Title',
                hintStyle: TextStyle(fontSize: ScreenUtil().setSp(17))
              ),
            ),
          ),
          TextField(
            
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Notes',
                hintStyle: TextStyle(fontSize: ScreenUtil().setSp(17))
            ),
          ),
        ],
      ),
    );
  }
}
