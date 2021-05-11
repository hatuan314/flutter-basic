
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/all_page/widgets/sticky_header_widget.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';

class AllPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('All',style: TextStyle(color: Colors.black87,fontWeight: FontWeight.w900,fontSize: ScreenUtil().setSp(30)),),
              Column(
                children: List.generate(ModelListReminder.listReminder.length, (index){
                  return StickyHeaderAll(header:ModelListReminder.listReminder.keys.elementAt(index),conTent: ModelListReminder.listReminder['${ModelListReminder.listReminder.keys.elementAt(index)}'],color: ModelListReminder.myList['${ModelListReminder.listReminder.keys.elementAt(index)}'].color,);
                }),
              )
          ],
        ),
      ),
    );
  }
  Widget _appBar(BuildContext context){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: ScreenUtil().setSp(20),
              color: Colors.blue,
            ),
            Text('Lists',style: TextStyle(color: Colors.blue,fontSize: ScreenUtil().setSp(17)),)
          ],
        ),
      ),
      leadingWidth: ScreenUtil().setWidth(100),
    );
  }
}
