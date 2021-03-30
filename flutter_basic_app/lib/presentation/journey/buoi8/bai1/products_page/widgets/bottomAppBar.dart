import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
BottomAppBar bottomAppBar(){
  return BottomAppBar(
    child: Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().setHeight(95),
      color: Colors.white,
      child: Center(
        child: Container(
          width: ScreenUtil().setWidth(280),
          height: ScreenUtil().setHeight(70),
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(60)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueAccent.withOpacity(0.5),Colors.deepPurple.withOpacity(0.8)]
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: ScreenUtil().setHeight(50),
                height: ScreenUtil().setHeight(50),
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.work,color: Colors.red,size: ScreenUtil().setSp(25),),
              ),
              Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: ScreenUtil().setSp(20)),),
              Container(
                child: Row(
                  children: [
                    Icon(Icons.arrow_forward_ios,size:  ScreenUtil().setSp(20),color: Colors.white.withOpacity(0.25),),
                    Icon(Icons.arrow_forward_ios,size: ScreenUtil().setSp(20),color: Colors.white.withOpacity(0.5)),
                    Icon(Icons.arrow_forward_ios,size:   ScreenUtil().setSp(20),color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}