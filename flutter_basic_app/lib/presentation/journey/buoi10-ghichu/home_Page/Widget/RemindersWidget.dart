
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
class remindersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(45),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10))
      ),
      child: Padding(
        padding:  EdgeInsets.only(left: ScreenUtil().setWidth(10),right:ScreenUtil().setWidth(10)),
        child: Row(
          children: [
            Container(
              width: ScreenUtil().setWidth(25),
              height: ScreenUtil().setWidth(25),
              decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle
              ),
              child: Center(child: Icon(Icons.list,color: Colors.white,size: ScreenUtil().setSp(19),)),
            ),
            SizedBox(
              width: ScreenUtil().setWidth(15),
            ),
            Text('Reminders',style: TextStyle(color: Colors.black,fontSize: ScreenUtil().setSp(14)),),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child:Text('4',style: TextStyle(color: Colors.black54,fontSize: ScreenUtil().setSp(16)),)
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child:Icon(Icons.navigate_next_outlined,color: Colors.black26,size: ScreenUtil().setSp(20),),
            ),
          ],
        ),
      ),
    );
  }
}
