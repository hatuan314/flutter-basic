import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai3/Widets/Scremm3.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai3/Widets/Scremm4.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai3/Widets/Profile.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai3/Widets/MY_wallet.dart';

class thongTinKhachhang extends StatefulWidget {
  @override
  _thongTinKhachhangState createState() => _thongTinKhachhangState();
}

class _thongTinKhachhangState extends State<thongTinKhachhang> {
  List _list=[{'icon':Icons.home},
    {'icon': Icons.web},
    {'icon': Icons.analytics_outlined},
    {'icon':Icons.account_circle_outlined}
  ];
  int vitriscrem=0;
List screm=[scremm3(),scremm2(),scremm4(),Screm1()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
           screm[vitriscrem],
          Positioned(
            bottom: 30,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Container(
                  height: 60,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 7,
                        offset: Offset(0,31)
                      )
                    ]
                  ),
                  child: ListView.builder(
                    itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,i){
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                        child: GestureDetector(
                          onTap: (){
                              vitriscrem=i;
                              setState(() {
                              });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                          Icon(_list[i]['icon'],size: 30,color: i==vitriscrem?Colors.indigo:Colors.cyanAccent,),
                                i==vitriscrem? Container(
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    shape: BoxShape.circle
                                  ),
                                ):SizedBox()
                              ],
                      ),
                        )
                      );
                      }
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}
