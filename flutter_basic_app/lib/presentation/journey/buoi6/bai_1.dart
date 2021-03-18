
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Bai1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: ScreenUtil().setHeight(550),
              color: Colors.pink,
              width: ScreenUtil().setWidth(450),
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              size: Size(ScreenUtil().setWidth(500), ScreenUtil().setHeight(900)),
              painter: MyPainter(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              //color: Colors.blue,
              height: ScreenUtil().setHeight(250),
              width: ScreenUtil().setWidth(500),
              //color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top:ScreenUtil().setHeight(25),
                        bottom: ScreenUtil().setHeight(15)),
                    child: Text(
                      '   Order Your \nDelicious Food',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: ScreenUtil().setSp(38),
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                    child: Text(
                      'Ask not what you can do for your country, ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(15),
                          color: Colors.black.withOpacity(0.3)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(15)),
                    child: Text(
                      ' Ask what\'s for lunch',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ScreenUtil().setSp(17),
                          color: Colors.black.withOpacity(0.3)),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      autofocus: true,
                      icon: Icon(
                        Icons.arrow_forward,
                        size: ScreenUtil().setSp(35),
                        color: Colors.white,
                      ),
                    ),
                    width: ScreenUtil().setWidth(70),
                    height: ScreenUtil().setHeight(60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.pink[200]),
                  ),
                ],
              ),
            ),
          )
        ]));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var _style = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawOval(
        Rect.fromLTRB(-size.width * 0.57, size.height * 4/ 3,
            size.width * 1.57, size.height * 0.63),
        _style);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
