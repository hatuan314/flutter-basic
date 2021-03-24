
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai1/constrants/route_constantsbuoi7bai1.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/buoi7_routers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Padding grid_View(BuildContext context) {
  List _list=[{
    'tittle':'PASSWORDS',
    'indexItem':'28',
    'img':'assets/img/password.png'
  },
    {
      'tittle':'IMAGES',
      'indexItem':'500',
      'img':'assets/img/img.png'
    },
    {
      'tittle':'VIDEOS',
      'indexItem':'13',
      'img':'assets/img/video.png'
    },
    {
      'tittle':'RANDOM',
      'indexItem':'9',
      'img':'assets/img/random.png'
    },
    {
      'tittle':'IMPORTANT',
      'indexItem':'6',
      'img':'assets/img/important.png'
    },
    {
      'tittle':'UNTITLED',
      'indexItem':'0',
      'img':'assets/img/uniti.png'
    }
  ];
  return Padding(
    padding: EdgeInsets.fromLTRB(0, ScreenUtil().setHeight(20), 0, 0),
    child: Container(
      color: Colors.transparent,
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: ScreenUtil().setWidth(20),
        crossAxisSpacing: ScreenUtil().setWidth(20),
        padding: EdgeInsets.only(
            right: ScreenUtil().setWidth(20),
            top: ScreenUtil().setWidth(20),
            left: ScreenUtil().setWidth(20)),
        children: List.generate(6, (index) {
          return GestureDetector(
            onTap: (){
               if(index==1){
                 Navigator.pushNamed(context, Routebai1.img);
               }
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.green.withOpacity(0.2),
                        blurRadius: 15,
                        offset: Offset(5, 5))
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10,top: 10),
                    child: Icon(Icons.keyboard_control,color: Colors.black26,),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(130),
                    width: double.infinity,
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: ScreenUtil().setWidth(50),
                          width: ScreenUtil().setWidth(50),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(_list[index]['img']),
                              fit: BoxFit.fill
                            )
                          ),
                        ),
                        SizedBox(
                          height: ScreenUtil().setHeight(30),
                        ),
                        Text(_list[index]['tittle'],style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(17)),),
                        Text('${_list[index]['indexItem']} Items in Box',style: TextStyle(color: Colors.black54.withOpacity(0.4),fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(15)),)
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    ),
  );
}
