

import 'dart:ui';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/home_page/provider_home_page.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
class MyListWiget extends StatelessWidget {
  String color;
  String title;
  MyListWiget({Key key,this.color, this.title}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

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
                    color: Color(int.parse(color)),
                    shape: BoxShape.circle
                ),
                child: Center(child: Icon(Icons.list,color: Colors.white,size: ScreenUtil().setSp(22),)),
              ),
              SizedBox(
                width: ScreenUtil().setWidth(15),
              ),
              Text('${title}',style: TextStyle(color: Colors.black,fontSize: ScreenUtil().setSp(20)),),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child:Text('${context.watch<ProviderHomePage>().leghtAll}',style: TextStyle(color: Colors.black54,fontSize: ScreenUtil().setSp(16)),)
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
