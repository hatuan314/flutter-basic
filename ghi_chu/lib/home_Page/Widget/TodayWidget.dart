

import 'dart:ui';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';

import '../ProviderHomePage.dart';
class todayWidget extends StatelessWidget {
  var data;

  todayWidget(this.data);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, data['push']);
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
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
                        color: Colors.blue,
                        shape: BoxShape.circle
                    ),
                    child: Icon(data['icons'],color: Colors.white,size: ScreenUtil().setSp(25),),
                  ),
                 data['sum']
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
