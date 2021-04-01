import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget B1appbar( )
{
  return AppBar(
toolbarHeight: ScreenUtil().setHeight(80),
    backgroundColor: Colors.transparent,
    automaticallyImplyLeading: false,
    elevation: 0,
    title: Row(
      children: [
     Expanded(flex: 1,
          child: Container(
            alignment: Alignment.center,
            //margin: EdgeInsets.all(ScreenUtil().setHeight(5)),
            padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      offset: Offset(0,10),
                      blurRadius: ScreenUtil().setHeight(10),
                      spreadRadius: ScreenUtil().setSp(5),
                  )
                ]
            ),
            child: Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
              child: Icon(Icons.arrow_back_ios_rounded,
                size: ScreenUtil().setSp(25),
                color: Colors.black,),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Text('Details',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(22),
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ),

      ],
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(10),
          top:ScreenUtil().setHeight(5),
          bottom: ScreenUtil().setHeight(5),),
        child:
        Container(
          margin: EdgeInsets.all(ScreenUtil().setHeight(5)),
          padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  offset: Offset(0,10),
                  blurRadius: ScreenUtil().setHeight(10),
                  spreadRadius: ScreenUtil().setSp(5),
                )
              ]
          ),
          child: Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(8)),
            child: Icon(
                  Icons.share_outlined,
                  color: Colors.black,
                  size: ScreenUtil().setSp(25),),
          ),
        ),
      )
    ],
  );
}