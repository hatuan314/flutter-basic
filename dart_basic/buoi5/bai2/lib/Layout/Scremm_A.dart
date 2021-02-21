import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
class MyAppstf extends StatefulWidget {
  @override
  _MyAppstfState createState() => _MyAppstfState();
}

class _MyAppstfState extends State<MyAppstf> {
  double x=0,y=0;
  double opcity=1;
  double xbutton=0,ybutton=0.8;
  double text=50;
  double sizeButtonx=150,sizeButtony=30;
double topPossi=180;
  double opacitychu=0;
  VideoPlayerController playerController;
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
       body: Stack(
         children: [
           AnimatedAlign(
               alignment:Alignment(x,y),
               duration: Duration(milliseconds: 300),
               child: Container(
                 width: 200,
                 height: 200,
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Text("Bike",style: TextStyle(fontSize: text),),
                         Text(".me",style: TextStyle(fontSize: text,color: Colors.blue),),
                       ],
                     ),
                     Opacity(
                         opacity: opcity,
                         child: Text("every day")
                     ),
                   ],
                 ),
               )
           ),
          opcity==0?AnimatedPositioned(
          top: topPossi,
          right: 0,
          left: 0,
          duration: Duration(milliseconds: 120),
          child: Container(
          width: 100,
          height: 350,
          child: Image.asset('assets/img/daidienanh.jpg'),
          ),
         ):Text(''),
        Positioned(
          top: (180+350+40).toDouble(),
            left: 50,
            child: Opacity(
              opacity: opacitychu,
              child: Container(
                width: 250,
                height: 90,
                child: Text('Hello there, Welcome to our app.\nYou can easily discover\ncommunies anh stores about bike\naround yoi!'
                  ,style: TextStyle(color: Colors.black38,fontSize: 16),),
              ),
            )
        ),
       xbutton!=0?   AnimatedAlign(
               alignment: Alignment(xbutton,ybutton),
               duration: ybutton==0.95?Duration(microseconds: 0):Duration(seconds: 1),
             child: GestureDetector(
               onTap: (){
                animatedContai();
               },
               child: Padding(
                 padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                 child: Container(
                   width: sizeButtonx,
                   height: sizeButtony,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                   child: sizeButtony==420?
                 Container(
                   width: sizeButtonx,
                     height: sizeButtony,
                     child: Padding(
                       padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                       child: Column(
                         children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                                  child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 30),),
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(100, 0, 0, 0),
                                  child: Text('/ Login',style: TextStyle(color: Colors.indigo,fontSize: 18),),
                                )
                              ],
                            ),
                           Container(
                             height: 20,
                           ),
                           TextField(
                             decoration: InputDecoration(
                               hintText: 'Name'
                             ),
                           ),
                           Container(
                             height: 15,
                           ),
                           TextField(
                             decoration: InputDecoration(
                                 hintText: 'Email'
                             ),
                           ),
                           Container(
                             height: 15,
                           ),
                           TextField(
                             decoration: InputDecoration(
                                 hintText: 'Password'
                             ),
                           ),
                           Container(
                             height: 40,
                           ),
                           SizedBox(
                             width: 200,
                             height: 50,
                             child: RaisedButton(
                                 onPressed: (){},
                               color: Colors.white,
                               shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.all(Radius.circular(40)),
                               ),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                                   children: [
                                     Text('Sign me up',style: TextStyle(fontSize: 16,color: Colors.indigo),),
                                     Container(
                                       width: 50,
                                       height: 2,
                                       color: Colors.indigo,
                                     )
                                   ],
                                 ),
                             ),
                           )
                         ],
                       ),
                     ),
                   )
                   :ybutton==0.95?Text(''):Row(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     children: [
                       Text("Next",style: TextStyle(color: Colors.white,fontSize: 20),),
                       Container(
                         width: 50,
                         height: 1,
                         color: Colors.white,
                       )
                     ],
                   ),
                 ),
               ),
             ),
           ):Text("")
         ],
       )
    );
  }
  void animatedContai(){
    ybutton=0.95;
    topPossi=85;
    Timer.periodic(Duration(microseconds: 50), (timer) {
      sizeButtony++;
      if(sizeButtony==sizeButtonx){
        sizeButtonx++;
      }
      if(sizeButtonx>=410){
        sizeButtonx=410;
      }
      if(sizeButtony>=420){
        sizeButtony=420;
        setState(() {
        });
        return;
      }
      setState(() {
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      playerController=VideoPlayerController.asset('assets/Videos/daidien.mp4')..initialize()..play()..setLooping(true);
      Future.delayed(Duration(seconds: 2),(){
        Timer.periodic(Duration(milliseconds: 20), (timer) {
          opacitychu=opacitychu+0.01;
          if(opacitychu>1){
            opacitychu=1;
            setState(() {

            });
            return;
          }
          setState(() {
          });
        });
        x=-0.6;
        y=-0.6;
       Timer.periodic(Duration(milliseconds: 30), (time){
         text=text-1;
         if(text<=40){
           text=40;
         }
         opcity=opcity-0.1;
         if(opcity<0){
           opcity=0;
           setState(() {
           });

         }
         if(opcity==0){
           xbutton=-0.7;
           return;
         }
         else{
           xbutton=0.2;
         }
 setState(() {
 });
       });
        setState(() {
        });
      });
    });
  }
}