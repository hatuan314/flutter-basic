import 'package:flutter/material.dart';

import 'package:flutter_basic_app/presentation/journey/buoi9/ProvidesTimer.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/home_Page/Schedule_Page/Listview_Personnal.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';

class pageView extends StatelessWidget {
  var data;

  pageView({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(30),
          ScreenUtil().setHeight(20),
          ScreenUtil().setWidth(30),
          ScreenUtil().setHeight(20)),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(Radius.circular(25))),
      child: PageView(
        children: [
          Container(
            margin: EdgeInsets.only(right: ScreenUtil().setWidth(5)),
            decoration: BoxDecoration(
                color: Colors.greenAccent,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Column(
              children: [
                Text(
                  'School',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: ScreenUtil().setSp(25),
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.cyan,
                borderRadius: BorderRadius.all(Radius.circular(25))),
            child: Column(
              children: [
                Text(
                  'Personal',
                  style: TextStyle(
                      color: Colors.indigo,
                      fontSize: ScreenUtil().setSp(25),
                      fontWeight: FontWeight.w600),
                ),
                Expanded(child: listviewPersonal())
              ],
            ),
          )
        ],
      ),
    );
  }
}
