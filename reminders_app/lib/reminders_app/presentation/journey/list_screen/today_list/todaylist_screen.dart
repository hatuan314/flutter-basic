import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list_screen/today_list/today_list_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list_screen/today_list/today_provider.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list_screen/widget_constants/appbar.dart';

import '../../reminders_list.dart';
class TodayList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TodayList();

}
class _TodayList extends State<TodayList> {
  String now =  DateTime.now().day<10?'0'+DateTime.now().day.toString():DateTime.now().day.toString() + "/" +(DateTime.now().month<10?'0'+DateTime.now().month.toString():DateTime.now().month.toString()) + "/" +
      DateTime.now().year.toString();
  TodayStream todayStream= TodayStream();
  @override
  void dispose() {
    todayStream.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
todayStream.update();
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar(context),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: ScreenUtil().setHeight(10),
                        left: ScreenUtil().setWidth(20)),
                    child: Text(
                      'Today',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: ScreenUtil().setSp(25),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  RemindersList.allReminders.containsKey(now)?todayListWidget(context):Padding(
                    padding: EdgeInsets.only(top:ScreenUtil().screenHeight/2-100),
                    child:
                    Align(
                      alignment: Alignment.center,
                      child: Text('No Reminders',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: ScreenUtil().setSp(20)
                        ),),
                    ),

                  )


                ])));
  }
Widget todayListWidget(BuildContext context)
{
  int id;
  return    Expanded(
      child: Padding(
          padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(12),
            right: ScreenUtil().setWidth(12),
            left: ScreenUtil().setWidth(20),
          ),
          child: StreamBuilder(
            stream: todayStream.todayListStream,
            builder: (context, snapshot) {
              return ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: todayStream.todayList.length,// todayStream.todayList.length,
                  itemBuilder: (context, index) {
                    String time=DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch( todayStream.todayList[index].dateAndTime));
                    String date=DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( todayStream.todayList[index].dateAndTime));

                    return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                    secondaryActions: [
                    IconSlideAction(
                    caption: 'Edit',
                    iconWidget: Icon(Icons.edit,color: Colors.white,),
                    color: Colors.blue,
                    onTap: () => {},
                    ),
                    IconSlideAction(
                    caption: 'Delete',
                    iconWidget: Icon(Icons.delete,color: Colors.white,),
                    color:Colors.red,
                    onTap: () => {
                      showDialog(context: context, builder: (_)=>AlertDialog(
                        title:Text('Delete ?'),
                        actions: [
                          FlatButton(
                            onPressed: () {Navigator.pop(context);},
                            child: Text('Cancel'),
                          ),
                          FlatButton(
                            onPressed: () {
                              id= todayStream.todayList[index].id;
                              RemindersList.allReminders[now].removeAt(index);
                              if( RemindersList.allReminders[now].length==0)
                              {
                              RemindersList.allReminders.remove(now);
                              };
                              for (int i = 0; i <RemindersList.MyLists.length;i++)

                              for (int j = 0; j <RemindersList.MyLists[i].list.length;j++)

                              if (RemindersList.MyLists[i].list[j].id ==id)
                              {
                              RemindersList.MyLists[i].list.removeAt(j);
                              j--;

                              }

                              ;
                              index--;
                              todayStream.update();
                              Navigator.pop(context);},
                            child: Text('OK'),
                          ),
                        ],
                      )),


                    },
                    )
                    ],
                    actionExtentRatio: 0.2,
                    child:Container(
                        padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: ScreenUtil().setHeight(15),
                                height: ScreenUtil().setHeight(15),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (RemindersList
                                      .allReminders[now][index]
                                      .priority ==
                                      3
                                      ? Colors.red
                                      : (RemindersList
                                      .allReminders[now][index]
                                      .priority ==
                                      1
                                      ? Colors.yellow
                                      : (RemindersList
                                      .allReminders[now][index]
                                      .priority ==
                                      2
                                      ? Colors.orange
                                      : Colors.grey))),
                                ),

                              ),
                              Padding(
                                padding:  EdgeInsets.only(
                                    left: ScreenUtil().setWidth(20)
                                ),
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children:[
                                      Text(
                                        RemindersList
                                            .allReminders[now][index]
                                            .title,
                                        style: TextStyle(
                                            fontWeight:
                                            FontWeight.w500,
                                            color: Colors.black,
                                            fontSize: ScreenUtil()
                                                .setSp(17)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: ScreenUtil()
                                                .setHeight(3)),
                                        child: Text
                                              ( (RemindersList.allReminders[now][index].dateAndTime%10==1)
                                              ? '${time} \n${RemindersList.allReminders[now][index].notes}'
                                              : '${RemindersList.allReminders[now][index].notes}',
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
                            ])));
                  });
            }
          )));
}

}
