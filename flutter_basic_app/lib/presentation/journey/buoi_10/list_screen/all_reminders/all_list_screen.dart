import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminders_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'all_list_provider.dart';

class AllRemindersList extends StatelessWidget {
  // RemindersList RemindersList = RemindersList();

  String now = DateTime.now().day.toString() +
      "/" +
      DateTime.now().month.toString() +
      "/" +
      DateTime.now().year.toString();
  @override
  Widget build(BuildContext context) {
    final item=Provider.of<AllListProvider>(context);
    item.MyLists=RemindersList.MyLists;
    final AlertDialog errorDialog = AlertDialog(
      title:Text('Delete ?'),
      actions: [
        FlatButton(
          onPressed: () {Navigator.pop(context);},
          child: Text('OK'),
        ),
      ],
    );
    int id;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: _appBar(context),
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.only(
                    top: ScreenUtil().setHeight(10),
                    left: ScreenUtil().setWidth(20)),
                child: Text(
                  'All',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(25),
                      fontWeight: FontWeight.w700),
                ),
              ),
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
                    itemCount: item.MyLists.length,
                    itemBuilder: (context, index) {
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(10),
                            //   left: ScreenUtil().setWidth(20)
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              item.MyLists[index].name,
                              style: TextStyle(
                                  color: item.MyLists[index].color,
                                  fontSize: ScreenUtil().setSp(20),
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                        item.MyLists[index].list.length == 0
                            ? Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(20),
                                    bottom: ScreenUtil().setHeight(20)),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'No Reminders',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: ScreenUtil().setSp(20)),
                                  ),
                                ),
                              )
                            :  ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: item
                                        .MyLists[index].list.length,
                                    itemBuilder: (context, index1) {
                                      return Slidable(

                                        closeOnScroll: true,
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
                                        id=item.MyLists[index].list[index1].id;
                                        RemindersList.MyLists[index].list.removeAt(index1);
                                        RemindersList.allReminders.forEach((key, value) {
                                        for(int i=0;i<value.length;i++)
                                        {
                                        if(value[i].id==id)
                                        {
                                        value.removeAt(i);
                                        i--;
                                        }
                                        }
                                        });
                                        index1--;
                                        item.update();
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
                                          padding: EdgeInsets.only(
                                              top: ScreenUtil().setHeight(10)),
                                          child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: ScreenUtil()
                                                      .setHeight(15),
                                                  height: ScreenUtil()
                                                      .setHeight(15),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: (item
                                                                .MyLists[index]
                                                                .list[index1]
                                                                .priority ==
                                                            3
                                                        ? Colors.red
                                                        : (item
                                                                    .MyLists[
                                                                        index]
                                                                    .list[
                                                                        index1]
                                                                    .priority ==
                                                                1
                                                            ? Colors.yellow
                                                            : (item
                                                                        .MyLists[
                                                                            index]
                                                                        .list[
                                                                            index1]
                                                                        .priority ==
                                                                    2
                                                                ? Colors.orange
                                                                : Colors
                                                                    .grey))),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: ScreenUtil()
                                                          .setWidth(20)),
                                                  child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          item
                                                              .MyLists[index]
                                                              .list[index1]
                                                              .title,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.black,
                                                              fontSize:
                                                                  ScreenUtil()
                                                                      .setSp(
                                                                          17)),
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets.only(
                                                              top: ScreenUtil()
                                                                  .setHeight(
                                                                      3)),
                                                          child: Text(
                                                            item
                                                                        .MyLists[
                                                                            index]
                                                                        .list[
                                                                            index1]
                                                                        .date !=
                                                                    ''
                                                                ? (item
                                                                            .MyLists[index]
                                                                            .list[index1]
                                                                            .time !=
                                                                        ''
                                                                    ? '${item.MyLists[index].list[index1].date == now ? 'Today' : item.MyLists[index].list[index1].date}, ${item.MyLists[index].list[index1].time} \n${item.MyLists[index].list[index1].notes}'
                                                                    : '${item.MyLists[index].list[index1].date == now ? 'Today' : item.MyLists[index].list[index1].date}\n${item.MyLists[index].list[index1].notes}')
                                                                : '${item.MyLists[index].list[index1].notes}',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color:
                                                                    Colors.grey,
                                                                fontSize:
                                                                    ScreenUtil()
                                                                        .setSp(
                                                                            12)),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin: EdgeInsets.only(
                                                              top: ScreenUtil()
                                                                  .setHeight(
                                                                      10)),
                                                          color: Colors.grey,
                                                          height: ScreenUtil()
                                                              .setHeight(0.5),
                                                          width: ScreenUtil()
                                                                  .screenWidth -
                                                              75,
                                                        )
                                                      ]),
                                                )
                                              ])));
                                    })
                      ]);
                    }),
              ))
            ])));
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      titleSpacing: 0,
      backgroundColor: Colors.white,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          size: ScreenUtil().setSp(22),
          color: Colors.blue,
        ),
      ),
      title: Text(
        'Lists',
        style: TextStyle(color: Colors.blue, fontSize: ScreenUtil().setSp(20)),
      ),
      actions: [
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, RouteList.createNewScreen),
          child: Container(
            padding: EdgeInsets.all(ScreenUtil().setWidth(2)),
            margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: ScreenUtil().setSp(30),
            ),
          ),
        )
      ],
    );
  }
}
