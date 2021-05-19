import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list_screen/all_reminders/all_list_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list_screen/widget_constants/appbar.dart';

import '../../reminders_list.dart';
import 'all_list_provider.dart';
class AllRemindersList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>_AllRemindersList();
  
}
class _AllRemindersList extends State<AllRemindersList> {
  String now =  DateTime.now().day<10?'0'+DateTime.now().day.toString():DateTime.now().day.toString() + "/" +(DateTime.now().month<10?'0'+DateTime.now().month.toString():DateTime.now().month.toString()) + "/" +
      DateTime.now().year.toString();
  AllListStream allListStream= AllListStream();
  @override
  void dispose() {
    allListStream.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
allListStream.update();
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
            appBar: appBar(context),
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
                child: StreamBuilder (
                  stream: allListStream.myListsStream,
                  builder: (context, snapshot) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.hasData?snapshot.data.length:1,
                        itemBuilder: (context, index) {
                          return Column(children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: ScreenUtil().setHeight(10),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(allListStream.MyLists[index].name,
                                  style: TextStyle(
                                      color:  allListStream.MyLists[index].color,
                                      fontSize: ScreenUtil().setSp(20),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            allListStream.MyLists[index].list.length == 0
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
                                        itemCount: allListStream.MyLists[index].list.length,
                                        itemBuilder: (context, index1) {
                                          String time=DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch( allListStream.MyLists[index]
                                              .list[index1].dateAndTime));
                                          String date=DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch( allListStream.MyLists[index]
                                              .list[index1].dateAndTime));
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
                                            String delDate;
                                            id= allListStream.MyLists[index].list[index1].id;
                                            RemindersList.MyLists[index].list.removeAt(index1);

                                            RemindersList.allReminders.forEach((key, value) {
                                            for(int i=0;i<value.length;i++)
                                            {
                                            if(value[i].id==id)
                                            {
                                            value.removeAt(i);
                                            i--;
                                            }
                                            if (RemindersList.allReminders[key].length == 0) {
                                              delDate=key;
                                            }
                                            }
                                            }
                                            );
                                            RemindersList.allReminders.remove(delDate);
                                            index1--;
                                            allListStream.update();
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
                                                        color: ( allListStream.MyLists[index]
                                                                    .list[index1]
                                                                    .priority ==
                                                                3
                                                            ? Colors.red
                                                            : ( allListStream.MyLists[index]
                                                                        .list[
                                                                            index1]
                                                                        .priority ==
                                                                    1
                                                                ? Colors.yellow
                                                                : ( allListStream.MyLists[index]
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
                                                              allListStream.MyLists[index]
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
                                                                allListStream.MyLists[index]
                                                                            .list[
                                                                                index1]
                                                                            .dateAndTime !=
                                                                        0
                                                                    ? (
                                                                    ( allListStream.MyLists[index]
                                                                        .list[
                                                                    index1]
                                                                        .dateAndTime%10==1)
                                                                        ? '${date == now ? 'Today' : date}, ${time} \n${ allListStream.MyLists[index].list[index1].notes}'
                                                                        : '${date == now ? 'Today' : date}\n${ allListStream.MyLists[index].list[index1].notes}')
                                                                    : '${ allListStream.MyLists[index].list[index1].notes}',
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
                        });
                  }
                ),
              ))
            ])));
  }


}
