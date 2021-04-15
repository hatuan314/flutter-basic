import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B1AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return B1appbar(context);
  }

  Widget B1appbar(BuildContext context)
  {
    return AppBar(
      toolbarHeight: ScreenUtil().setHeight(80),
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
      elevation: 0,
      leading:GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: 5),
          height: ScreenUtil().setWidth(60),
          width: ScreenUtil().setWidth(60),
          //margin: EdgeInsets.all(ScreenUtil().setHeight(5)),
          // padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
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
          child: Icon(Icons.arrow_back_ios_rounded,
            size: ScreenUtil().setSp(25),
            color: Colors.black,),
        ),
      ),
      title: Text('Details',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(22),
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      actions: [
        Container(
          height: ScreenUtil().setWidth(60),
          width: ScreenUtil().setWidth(60),
          margin: EdgeInsets.only(right: 5),
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
          child: Icon(
            Icons.share_outlined,
            color: Colors.black,
            size: ScreenUtil().setSp(25),),
        )
      ],
    );
  }

}