import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget bottomNavigationBar() {
  return Container(
    color: Colors.black,
    child: Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.home_outlined,color: Colors.white,size: 30,),
            color: Colors.white,
            iconSize: 30,
          ),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.search,color: Colors.white,),
            color: Colors.white,
            iconSize: 30,
          ),
        ),
        Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.add_box_outlined,color: Colors.white,),
              color: Colors.white,
              iconSize: 30,)),
        Expanded(flex: 1,
            child: IconButton(icon: Icon(Icons.favorite_outline_outlined,color: Colors.white,),
              color: Colors.white,
              iconSize: 30,),
        ),
        Expanded(
          flex: 1,
          child: IconButton(
              icon: CircleAvatar(
            backgroundImage: AssetImage('assets/images/ava.jpg'),
          )),
        )
      ],
    ),
  );
}
