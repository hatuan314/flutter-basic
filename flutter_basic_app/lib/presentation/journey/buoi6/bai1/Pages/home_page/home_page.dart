
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/home_page/Widgets/App_Bar_Widget.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/home_page/Widgets/Bottom_AppBar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/home_page/Widgets/List_SP.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/home_page/Widgets/List_view.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/home_page/Widgets/Tim_Kiem.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int vitri=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),

      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                container(),
                SizedBox(
                  height: 26,
                ),
                listview(),
                Container(
                  height: 100,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Popular items',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28),),
                            Text('182 item total',style: TextStyle(color: Colors.cyan,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Text('View All',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline
                        ),

                        )
                      ],
                    ),
                  ),
                ),
                listsp(context)
              ],
            ),
          ),
          bottomAppbar(),
          Positioned(
            bottom: 50,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue,Colors.deepPurple]
                  )
                ),
                child: Icon(Icons.work_rounded,color: Colors.white,size: 26,),
              )
          )
        ],
      )
    );
  }
}
