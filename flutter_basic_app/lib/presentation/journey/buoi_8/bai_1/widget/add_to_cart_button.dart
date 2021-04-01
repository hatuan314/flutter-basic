import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

Widget addToCartButton() {
  return Container(
    margin: EdgeInsets.only(
        left: ScreenUtil().setWidth(55),
        right: ScreenUtil().setWidth(55),
        top: ScreenUtil().setHeight(10),
        bottom: ScreenUtil().setHeight(10)),
    padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(10),
        bottom: ScreenUtil().setHeight(10)),
    decoration: BoxDecoration(
  gradient: LinearGradient(
    end: FractionalOffset.topCenter,
    begin: FractionalOffset.bottomCenter,
    tileMode: TileMode.repeated,
  colors: [Colors.deepPurpleAccent, Colors.deepPurpleAccent.withOpacity(0.5)],
  ),
      borderRadius: BorderRadius.circular(ScreenUtil().setHeight(50)),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.6),
          offset: Offset(0,15),
          blurRadius: ScreenUtil().setHeight(10),
          spreadRadius: ScreenUtil().setSp(-5),
        )
      ]
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
            flex: 2,
            child: Container(
              decoration:
                  BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Padding(
                padding:  EdgeInsets.all(ScreenUtil().setWidth(10)),
                child: Icon(
                  Icons.shopping_bag_rounded,
                  size: ScreenUtil().setSp(30),
                  color: Colors.pinkAccent,
                ),
              ),
            )),
        Expanded(
          flex: 4,
          child: Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(10), bottom: ScreenUtil().setHeight(10)
            ),
            child: Text(
              'Add to Cart',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(20)),
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: ScreenUtil().setSp(23),
                  color: Colors.white.withOpacity(0.3),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: ScreenUtil().setSp(23),
                  color: Colors.white.withOpacity(0.5),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: ScreenUtil().setSp(23),
                  color: Colors.white,
                ),
              ],
            ))
      ],
    ),
  );
}
