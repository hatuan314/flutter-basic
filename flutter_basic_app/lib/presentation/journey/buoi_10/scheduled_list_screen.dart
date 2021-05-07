import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScheduledList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: _appBar(context),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(10),
                        left: ScreenUtil().setWidth(20)),
                    child: Text(
                      'Scheduled',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                 /* Padding(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(10),
                        left: ScreenUtil().setWidth(20)),
                    child: Text(
                      'Reminders',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: ScreenUtil().setSp(18),
                          fontWeight: FontWeight.w600),
                    ),
                  ),*/
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(12),
                            right: ScreenUtil().setWidth(12),
                            left: ScreenUtil().setWidth(20),
                          ),
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: RemindersList.scheduledReminders.length,
                              itemBuilder: (context, index) {
                                return Container(
                                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                                    child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: ScreenUtil().setHeight(15),
                                            height: ScreenUtil().setHeight(15),
                                            color: (RemindersList.scheduledReminders[index]
                                            ['priority'] ==
                                                'High'
                                                ? Colors.red
                                                : (RemindersList.scheduledReminders[index]
                                            ['priority'] ==
                                                'Low'
                                                ? Colors.yellow
                                                : (RemindersList.scheduledReminders[index]
                                            ['priority'] ==
                                                'Medium'
                                                ? Colors.orange
                                                : Colors.grey))),
                                          ),
                                          Padding(
                                            padding:  EdgeInsets.only(
                                                left: ScreenUtil().setWidth(20)
                                            ),
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children:[
                                                  Text(
                                                    RemindersList.scheduledReminders[index]['title'],
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.w500,
                                                        color: Colors.black,
                                                        fontSize: ScreenUtil().setSp(17)),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(3)),
                                                    child: Text(
                                                      RemindersList.scheduledReminders[index]['date'] != ''
                                                          ? (RemindersList.scheduledReminders[index]
                                                      ['time'] !=
                                                          ''
                                                          ? '${RemindersList.scheduledReminders[index]['date']}, ${RemindersList.scheduledReminders[index]['time']} \n${RemindersList.scheduledReminders[index]['notes']}'
                                                          : '${RemindersList.scheduledReminders[index]['date']}\n${RemindersList.scheduledReminders[index]['notes']}')
                                                          : '${RemindersList.scheduledReminders[index]['notes']}',
                                                      style: TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          color: Colors.grey,
                                                          fontSize: ScreenUtil().setSp(12)),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only( top: ScreenUtil().setHeight(10)),
                                                    color: Colors.grey,
                                                    height: ScreenUtil().setHeight(0.5),
                                                    width: ScreenUtil().screenWidth-75,
                                                  )
                                                ]
                                            ),
                                          )
                                        ]));
                              }))),

                ])));
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: ()=> Navigator.pop(context),
        child: Icon(Icons.arrow_back_ios_rounded,
          size: ScreenUtil().setSp(22),
          color: Colors.blue,),
      ),
      title: Text(
        'Lists',
        style: TextStyle(color: Colors.blue, fontSize: ScreenUtil().setSp(20)),
      ),
      actions: [
        GestureDetector(
          onTap: ()=>Navigator.pushNamed(context, RouteList.createNewScreen),
          child: Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(2)),
            margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue
            ),
            child: Icon(Icons.add,color: Colors.white,
              size: ScreenUtil().setSp(30),),
          ),
        )
      ],
    );
  }
}
