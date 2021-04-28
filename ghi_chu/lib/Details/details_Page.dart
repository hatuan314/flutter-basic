


import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ghi_chu/Details/Provider.dart';
import 'package:ghi_chu/Details/Widgets/time_Widget.dart';
import 'package:provider/provider.dart';
class detailsPage extends StatefulWidget {
  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  bool date = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: ScreenUtil().setWidth(150),
        leading: GestureDetector(
          onTap: () {
              if(switchdate.getdate){
               if(switchdate.gettime){
                       Navigator.pop(context,[{'date':switchdate.getdataTime,'time':[switchdate.gethour,switchdate.getminuner].toList()}].toList());
              }else{
                Navigator.pop(context,[{'date':switchdate.getdataTime,'time':''}].toList());
               }
            }
              else{

                Navigator.pop(context,null);
              }
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.blue,
              ),
              Text(
                'New Reminder',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
              )
            ],
          ),
        ),
        title: Text(
          'Details',
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(18)),
        ),
        centerTitle: true,
        actions: [
          Center(
              child: Text(
            'Add',
            style: TextStyle(
                color: Colors.black54,
                fontSize: ScreenUtil().setSp(15),
                fontWeight: FontWeight.w700),
          )),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15)),
          child: Column(
            children: [
               timeWidget()
            ],
          ),
        ),
      ),
    );
  }
}
