import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bai1AppBar {
  static String title='aa';
static Widget B1appbar(Icon leadingIcon, String title, String subtitle, Icon actionIcon)
 {
   return AppBar(
     backgroundColor: Colors.transparent,
     elevation: 0,
     leading: Padding(
       padding: EdgeInsets.only(
         left: ScreenUtil().setWidth(10),
       top:ScreenUtil().setHeight(5),
       bottom: ScreenUtil().setHeight(5),),
       child: Container(
         alignment: Alignment.center,
         margin: EdgeInsets.all(ScreenUtil().setHeight(5)),
         decoration: BoxDecoration(
           shape: BoxShape.circle,
           color: Colors.indigoAccent,
         ),
         child: leadingIcon,
       ),
     ),
     centerTitle: true,
     title: Column(
       children: [
         Text(title,
         style: TextStyle(
           fontSize: ScreenUtil().setSp(20),
           fontFamily: 'AR',
           fontWeight: FontWeight.w700,
           color: Colors.black,
         ),
         ),
         Padding(
           padding:  EdgeInsets.only(top: ScreenUtil().setHeight(4)),
           child: Text(subtitle,
             style: TextStyle(
               fontSize: ScreenUtil().setSp(13),
               fontWeight: FontWeight.w700,
               color: Colors.grey.withOpacity(0.8),
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
           shape: BoxShape.circle,
           color: Colors.indigoAccent,
         ),
         child: actionIcon,
       ),
   )
     ],
   );
 }
}