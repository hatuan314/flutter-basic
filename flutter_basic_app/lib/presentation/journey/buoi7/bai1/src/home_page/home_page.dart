
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai1/src/home_page/grid_view_Widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class home_page extends StatefulWidget {
  @override
  _home_pageState createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  @override
  Widget build(BuildContext context) {
    double witdh=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.97),
      appBar: _appBar(),
      body: Stack(
        children: [
          grid_View(context),
          Positioned(
            bottom: height*0.12,
              right: witdh/2-ScreenUtil().setWidth(80)/2,
              child: Container(
                height: ScreenUtil().setWidth(80),
                width: ScreenUtil().setWidth(80),
                decoration: BoxDecoration(
                    color: Colors.indigo,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      offset: Offset(0, 4)
                    )
                  ]
                ),
                child:Center(child: Text("+",style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setWidth(60)),)),
              ),
          )
        ],
      )
    );
    
  }
  Widget _appBar(){
   return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(9),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.indigo,
          ),
          child: Icon(Icons.list_sharp,color: Colors.white,size: ScreenUtil().setSp(30),),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          Text('My Boxes',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: ScreenUtil().setWidth(20)),),
          Text('You have 4 boxes',style: TextStyle(color: Colors.black26,fontWeight: FontWeight.w700,fontSize: ScreenUtil().setWidth(16)),),
        ],
      ),
    );
  }
}
