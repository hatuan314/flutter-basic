import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_7/bai_1/widgets/appbar.dart';
import 'package:flutter_screenutil/screen_util.dart';


class B1Screen1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: Bai1AppBar.B1appbar(Icon(Icons.menu), 'My Boxes', 'You have 4 boxes',null),
      body:
      Stack(
        alignment: Alignment.center,
          children:[
      Column(
        children: [
        Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(
                  right: ScreenUtil().setWidth(20),
                  top: ScreenUtil().setHeight(25)),
              child: GridView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                children: [
                  gridViewItem('assets/images/passwords.png', 'PASSWORDS', '28 Items In Box'),
                  gridViewItem('assets/images/images.png', 'IMAGES', '500 Items In Box'),
                  gridViewItem('assets/images/videos.png', 'VIDEOS', '13 Items In Box'),
                  gridViewItem('assets/images/random.png', 'RANDOM', '9 Items In Box'),
                  gridViewItem('assets/images/important.png', 'IMPORTANT', '0 Items In Box'),
                  gridViewItem('assets/images/untitled.png', 'UNTITLED', '0 Items In Box'),
                       ],
              ),
            ),
          ),
],
    ),
           Positioned(
          //  left: ScreenUtil().screenWidth/2-20,
             bottom: ScreenUtil().setHeight(30),
             child:
                 Container(child: FloatingActionButton(
         isExtended: true,
         backgroundColor: Colors.indigo.shade900.withOpacity(0.9),
          child: Icon(Icons.add,size: ScreenUtil().setSp(40),),
        ),),
          ),

        ]
      ),

    );
  }
 Widget gridViewItem(String imagePath, String title, String subtitle)
 {
   return Container(
     decoration: BoxDecoration(
       color: Colors.white,
         boxShadow: [
     BoxShadow(
     color: Colors.grey.withOpacity(0.1),
     //spreadRadius: 2,
     blurRadius: ScreenUtil().setHeight(7),
     offset: Offset(0, 7),
     ),]),
     margin: EdgeInsets.only(
         top:ScreenUtil().setWidth(20),
     left: ScreenUtil().setWidth(20)),
     padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
    // color: Colors.indigoAccent,
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Align(
           alignment: Alignment.topRight,
           child:  Icon(Icons.more_vert,
             color: Colors.grey.withOpacity(0.8),),
         ),

         Container(
           width: ScreenUtil().setWidth(65),
           height: ScreenUtil().setWidth(50),
           //padding: EdgeInsets.all(10),
           child:
         Image.asset(imagePath,fit: BoxFit.fitHeight,),
         ),
     Padding(
       padding:  EdgeInsets.only(top: ScreenUtil().setHeight(15)),
       child:
       Text(title,
           style: TextStyle(
             fontSize: ScreenUtil().setSp(14),
             fontFamily: 'AR',
             fontWeight: FontWeight.w800,
             color: Colors.black.withOpacity(0.6),
           ),
         ),
     ),
         Padding(
           padding:  EdgeInsets.only(top: ScreenUtil().setHeight(4)),
           child: Text(subtitle,
             style: TextStyle(
               fontSize: ScreenUtil().setSp(12.5),
               fontWeight: FontWeight.w700,
               color: Colors.grey.withOpacity(0.8),
             ),
           ),
         ),
       ],
     ),
   );
 }

}

