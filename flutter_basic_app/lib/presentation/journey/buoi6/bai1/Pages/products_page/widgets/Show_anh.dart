import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Stack pictureWidget(){ // widget là 1 danh từ ??? // void funtion() {}
  return  Stack(
    alignment: Alignment.center,
    children: [
    Container(
    height: 670,
    color: Colors.teal.withOpacity(0.08),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 230),
      child: Container(
        height: 100,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 30,color: Colors.white)
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
        top: 390,
        child: Container(
          height: 65,
          width: 140,
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
              Text('+',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.w400),),
              Container(
                width: 40,
                height:40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle
              ),
                child: Center(child: Text('2',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)),
              ),
              Container(
                width: 15,
                height: 4,
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
      Positioned(
        top: 40,
          right: 50,
          child: Container(
            width: 140,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Per Pice:',style: TextStyle(color: Colors.teal.withOpacity(0.6),fontSize: 13,fontWeight: FontWeight.bold),),
                  Text('đ26.50',style: TextStyle(color: Colors.pink.withOpacity(0.7),fontWeight: FontWeight.bold,fontSize: 25),),
                ],
              ),
            ),
          )
      ),
      Positioned(
        bottom: 10,
          child: Column(
            children: [
              Text('Soba Noodles With',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27,color: Colors.black.withOpacity(0.8)),),
              SizedBox(
                height:5,
              ),
              Text('Spicy & Greens',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),),
              SizedBox(
                height:13,
              ),
              Text('Vagan flavour',style: TextStyle(color: Colors.teal.withOpacity(0.6),fontSize: 15,fontWeight: FontWeight.w600),),
              SizedBox(
                height:18,
              ),
              Row(
                children: [
                Container(
                  height: 60,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/img/dongho.png',scale: 1,),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('15-20 Min',style: TextStyle(fontWeight: FontWeight.bold),),

                          Text('Delivery',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal.withOpacity(0.6)),)
                        ],
                      )
                    ],
                  ),
                ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    height: 60,
                    width: 150,
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
                            Text('435 Kcal',style: TextStyle(fontWeight: FontWeight.bold),),

                            Text('Calories',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.teal.withOpacity(0.6)),)
                          ],
                        )
                      ],
                    ),
                  ),
              ],
              ),
              SizedBox(
                height:15,
              ),
            ],
          )
      )
    ],
  );
}