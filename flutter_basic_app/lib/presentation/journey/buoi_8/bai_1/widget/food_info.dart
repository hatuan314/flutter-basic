import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget foodInfo()
{
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(
        padding:  EdgeInsets.only(top: ScreenUtil().setHeight(10)),
        child: Text('Soba Noodles With',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(27),
            fontWeight: FontWeight.w700,
            color: Colors.black.withOpacity(0.7),
          ),
        ),
      ),
      Text('Spicy & Greens',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(27),
          fontWeight: FontWeight.w500,
          color: Colors.black.withOpacity(0.7),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding:   EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: Text('Vegan flavour',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(17),
                fontWeight: FontWeight.w600,
                color: Colors.grey[400],
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(25),
            width: ScreenUtil().setHeight(25),
            child: Image.asset('assets/images/vegetable.png',fit: BoxFit.fill,),
          )

        ],
      )
     
    ],
  );
}