

import 'dart:ui';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/reminder.dart';

import '../ProviderHomePage.dart';
class remindersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RouteList.reminders);
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
        width: double.infinity,
        height: ScreenUtil().setHeight(60),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(
          padding:  EdgeInsets.only(left: ScreenUtil().setWidth(10),right:ScreenUtil().setWidth(10)),
          child: Row(
            children: [
              Container(
                width: ScreenUtil().setWidth(30),
                height: ScreenUtil().setWidth(30),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle
                ),
                child: Center(child: Icon(Icons.list,color: Colors.white,size: ScreenUtil().setSp(22),)),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15),
              ),
              Text('Reminders',style: TextStyle(color: Colors.black,fontSize: ScreenUtil().setSp(20)),),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child:Text('${context.watch<providerhomePage>().leghtAll}',style: TextStyle(color: Colors.black54,fontSize: ScreenUtil().setSp(16)),)
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child:Icon(Icons.navigate_next_outlined,color: Colors.black26,size: ScreenUtil().setSp(20),),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
