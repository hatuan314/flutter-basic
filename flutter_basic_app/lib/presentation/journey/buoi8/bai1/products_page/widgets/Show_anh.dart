
import 'dart:ui';
import 'package:flutter_basic_app/presentation/journey/buoi8/bai1/products_page/ProvidesCount.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
Stack pictureWidget(BuildContext context){
  return  Stack(
    alignment: Alignment.center,
    children: [
    Container(
    height: ScreenUtil().screenHeight,
    color: Colors.teal.withOpacity(0.08),
    child: Padding(
      padding:  EdgeInsets.fromLTRB(0, 0, 0, ScreenUtil().setHeight(230)),
      child: Container(
        height: ScreenUtil().setHeight(100),
        padding: EdgeInsets.all(ScreenUtil().setSp(30)),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: ScreenUtil().setSp(30),color: Colors.white)
        ),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.pinkAccent.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0,15)
              )
            ],
              shape: BoxShape.circle,
              color: Colors.yellow,
              image: DecorationImage(
                  image: AssetImage('assets/img/doan1.jpg'),
                  fit: BoxFit.fitWidth
              )
          ),
        ),
      ),
    ),
  ),
      Positioned(
        top: ScreenUtil().setHeight(415),
        child: Container(
          height: ScreenUtil().setHeight(70),
          width: ScreenUtil().setWidth(140),
         decoration: BoxDecoration(
           boxShadow: [
             BoxShadow(
               color: Colors.grey.withOpacity(0.2),
          blurRadius: 8,
               offset: Offset(0,5),

             )
           ],
           borderRadius: BorderRadius.all(Radius.circular(40)),
           gradient: LinearGradient(
             begin: Alignment.topCenter,
             end: Alignment.bottomCenter,
             colors: [Colors.pinkAccent.withOpacity(0.8),Colors.pink]
           )
         ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  context.read<ProvidesCount>().cong();
                },
                child:  Text('+',style: TextStyle(color: Colors.white,fontSize: ScreenUtil().setSp(40),fontWeight: FontWeight.w400),),
              ),

              Container(
                width: ScreenUtil().setWidth(40),
                height:ScreenUtil().setWidth(40),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
                child: Center(child: Text('${context.watch<ProvidesCount>().count}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(25)),)),
              ),
              GestureDetector(
                onTap: (){
                  context.read<ProvidesCount>().tru();
                },
                child: Container(
                  width: 15,
                  height: 4,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: ScreenUtil().setHeight(40),
          right: ScreenUtil().setWidth(50),
          child: Container(
            width: ScreenUtil().setWidth(140),
            height: ScreenUtil().setHeight(70),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Padding(
              padding:  EdgeInsets.fromLTRB(ScreenUtil().setWidth(30), 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Per Pice:',style: TextStyle(color: Colors.teal.withOpacity(0.6),fontSize: ScreenUtil().setSp(13),fontWeight: FontWeight.bold),),
                  Text('đ${context.watch<ProvidesCount>().count*13.50}',style: TextStyle(color: Colors.pink.withOpacity(0.7),fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(25)),),
                ],
              ),
            ),
          )
      ),
      Positioned(
        bottom: ScreenUtil().setHeight(10),
          child: Column(
            children: [
              Text('Soba Noodles With',style: TextStyle(fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(28),color: Colors.black.withOpacity(0.8)),),
              SizedBox(
                height:5,
              ),
              Text('Spicy & Greens',style: TextStyle(fontSize: ScreenUtil().setSp(25),fontWeight: FontWeight.w500),),
              SizedBox(
                height:ScreenUtil().setHeight(13),
              ),
              Text('Vagan flavour',style: TextStyle(color: Colors.teal.withOpacity(0.6),fontSize: ScreenUtil().setSp(15),fontWeight: FontWeight.w600),),
              SizedBox(
                height:ScreenUtil().setHeight(18),
              ),
              Row(
                children: [
                Container(
                  height: ScreenUtil().setHeight(60),
                  width: ScreenUtil().setWidth(150),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/dongho.png',scale: 1,),
                      SizedBox(
                        width: ScreenUtil().setWidth(10),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('15-20 Min',style: TextStyle(fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(13)),),

                          Text('Delivery',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal.withOpacity(0.6),fontSize: ScreenUtil().setSp(14)),)
                        ],
                      )
                    ],
                  ),
                ),
                  SizedBox(
                    width: ScreenUtil().setWidth(50),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(60),
                    width: ScreenUtil().setWidth(150),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/img/lua.png',scale: 1,),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('435 Kcal',style: TextStyle(fontWeight: FontWeight.bold,fontSize: ScreenUtil().setSp(13)),),

                            Text('Calories',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal.withOpacity(0.6),fontSize: ScreenUtil().setSp(14)),)
                          ],
                        )
                      ],
                    ),
                  ),
              ],
              ),
              SizedBox(
                height:ScreenUtil().setWidth(15),
              ),
            ],
          )
      )
    ],
  );
}