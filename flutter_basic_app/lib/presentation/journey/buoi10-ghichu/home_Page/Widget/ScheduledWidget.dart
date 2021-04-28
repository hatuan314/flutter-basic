import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
class scheduledWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
        width: ScreenUtil().setWidth(180),
        height: ScreenUtil().setHeight(80),
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
                    padding: EdgeInsets.all(5),
                    width: ScreenUtil().setWidth(30),
                    height: ScreenUtil().setWidth(30),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle
                    ),
                    child: Icon(Icons.calendar_today,color: Colors.white,size: ScreenUtil().setSp(20),),
                  ),
                  Text('0',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(25)),)
                ],
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Text('Scheduled',style: TextStyle(color: Colors.black45,fontSize: ScreenUtil().setSp(13),fontWeight: FontWeight.w600),)
            ],
          ),
        )
    );
  }
}
