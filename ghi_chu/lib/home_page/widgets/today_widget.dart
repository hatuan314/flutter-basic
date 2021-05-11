

import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class TodayWidget extends StatelessWidget {
  var data;

  TodayWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, data['push']);
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        // width: ScreenUtil().setWidth(180),
        height: ScreenUtil().setHeight(110),
        decoration: BoxDecoration(
            color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), ScreenUtil().setHeight(10), ScreenUtil().setWidth(20),  ScreenUtil().setHeight(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: ScreenUtil().setHeight(5)),
                    padding: EdgeInsets.all(5),
                    width: ScreenUtil().setWidth(37),
                    height: ScreenUtil().setWidth(37),
                    decoration: BoxDecoration(
                        color: data['colors'],
                        shape: BoxShape.circle
                    ),
                    child: Icon(data['icons'],color: Colors.white,size: ScreenUtil().setSp(25),),
                  ),
                  Text(
                    '${data['sum']}',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil().setSp(37)),
                  )
                ],
              ),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(data['title'],style: TextStyle(color: Colors.black45,fontSize: ScreenUtil().setSp(15),fontWeight: FontWeight.w700),)),
              )
            ],
          ),
        )
      ),
    );
  }
}
