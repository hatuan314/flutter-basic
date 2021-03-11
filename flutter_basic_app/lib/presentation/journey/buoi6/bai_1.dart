
import 'dart:math' as math;

import 'package:flutter/material.dart';

class Bai1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 535,
              color: Colors.pink,
              width: 450,
              child: Image.asset(
                'assets/images/background.png',
                fit: BoxFit.fill,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CustomPaint(
              size: Size(500, 900),
              painter: MyPainter(),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 250,
              width: 500,
              //color: Colors.green,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      '   Order Your \nDelicious Food',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 40,
                          color: Colors.black.withOpacity(0.8)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Ask not what you can do for your country, ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.3)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 15),
                    child: Text(
                      ' Ask what\'s for lunch',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Colors.black.withOpacity(0.3)),
                    ),
                  ),
                  Container(
                    child: IconButton(
                      autofocus: true,
                      icon: Icon(
                        Icons.arrow_forward,
                        size: 35,
                        color: Colors.white,
                      ),
                    ),
                    width: 70,
                    height: 70,
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
        Rect.fromLTRB(-size.width * 0.35, size.height * 4 / 3,
            size.width * 1.35, size.height * 0.6),
        _style);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
