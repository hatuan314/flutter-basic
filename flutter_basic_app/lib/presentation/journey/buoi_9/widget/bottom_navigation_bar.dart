import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';

Widget bnBar (BuildContext context,int index)
{
  return Container(
  child: Row(
    children: [
      Expanded(
        flex: 1,
        child: IconButton(
          icon: Icon(Icons.event_note),
          onPressed: ()=>
          {
            //Navigator.popAndPushNamed(context, RouteList.b9Src3),
          index=0,
          }
        ),
      ),
    Expanded(
      flex: 1,
      child:IconButton(
        icon: Icon(Icons.search),
      ),
    ),
    Expanded(
      flex: 1,
      child:
      IconButton(
        icon: Icon(Icons.work_outline),
        onPressed: ()=>
        {
          //Navigator.popAndPushNamed(context, RouteList.b9Src2),
        index=2,
        }
      ),
    ),
    Expanded(
      flex: 1,
      child:
      IconButton(
        icon: Icon(Icons.power_settings_new_outlined),
      ),
    ),


    ],
  ),
  );
}