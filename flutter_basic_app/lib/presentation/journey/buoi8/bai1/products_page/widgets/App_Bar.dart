

import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_screenutil/screen_util.dart';
AppBar appBarWidgetThongtin(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.teal.withOpacity(0.08),
    automaticallyImplyLeading: false,
    title: Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap:(){
              Navigator.pop(context);
            } ,
            child: Container(
              width: ScreenUtil().setHeight(50),
              height: ScreenUtil().setHeight(50),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      offset: Offset(0,3), // changes position of shadow
                    ),
                  ]
              ),
              child: Padding(
                padding:  EdgeInsets.fromLTRB(ScreenUtil().setWidth(10), 0, 0, 0),
                child: Icon(Icons.arrow_back_ios,color: Colors.black87,),
              ),
            ),
          ),
          Center(
              child:
              Text('Details',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(23),
              ),
              )
          ),
          Container(
            width: ScreenUtil().setHeight(50),
            height: ScreenUtil().setHeight(50),
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: Offset(0,3), // changes position of shadow
                  ),
                ]
            ),
            child: Icon(Icons.share_outlined,color: Colors.black87,size: ScreenUtil().setSp(30),),
          ),
        ],
      ),
    ),

  );
}