import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/today_list/today_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class TodayList extends StatelessWidget {
  String now =  DateTime.now().day.toString() + "/" +DateTime.now().month.toString() + "/" +
      DateTime.now().year.toString();
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<TodayProvider>(context);
    item.todayList=RemindersList.allReminders[now];
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
  final item = Provider.of<TodayProvider>(context);
  return    Expanded(
      child: Padding(
          padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(12),
            right: ScreenUtil().setWidth(12),
            left: ScreenUtil().setWidth(20),
          ),
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: item.todayList.length,
              itemBuilder: (context, index) {
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
                id=item.todayList[index].id,
                RemindersList.allReminders[now].removeAt(index),
                  if( RemindersList.allReminders[now].length==0)
                    {
                      RemindersList.allReminders.remove(now),
                    },
                for (int i = 0; i <RemindersList.MyLists.length;i++)

                    for (int j = 0; j <RemindersList.MyLists[i].list.length;j++)

                        if (RemindersList.MyLists[i].list[j].id ==id)
                        {
                        RemindersList.MyLists[i].list.removeAt(j),
                          j--

                      }

                  ,
                index--,
                item.update(),
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
                                          (RemindersList
                                          .allReminders[now][index]
                                          .time !=
                                          ''
                                          ? '${RemindersList.allReminders[now][index].time} \n${RemindersList.allReminders[now][index].notes}'
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
              })));
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
