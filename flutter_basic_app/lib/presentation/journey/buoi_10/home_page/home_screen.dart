import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/list/list_provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/list/list_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/scheduled_list/scheduled_list_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/list_screen/today_list/todaylist_screen.dart';


import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import 'package:provider/provider.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';

import '../reminders_list.dart';
import 'homepage_provider.dart';

class B10HomeScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _B10HomeScreen();
}
class _B10HomeScreen extends State<B10HomeScreen> {
  final TextEditingController textName = TextEditingController();
  RemindersList remindersList= RemindersList();

  @override
  Widget build(BuildContext context) {
  //  log(context.watch<HomePageProvider>().MyList.length.toString());
    final item = Provider.of<HomePageProvider>(context);
    RemindersList.addDefaultList();
    context.watch<HomePageProvider>().MyLists=RemindersList.MyLists;
   // context.read<HomePageProvider>().update();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(

       child: ListView(
         shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            searchBar(),
            GridView(
                padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(20),
                  left: ScreenUtil().setWidth(10),
                  right: ScreenUtil().setWidth(10),
                ),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: ScreenUtil().setWidth(10),
                  childAspectRatio: 2.2,
                ),
                children: [
                  GestureDetector(
                    onTap:  () async
          {await Navigator.pushNamed(context, RouteList.todayListScreen)
              .whenComplete(()=>item.update());},
                    child: gridViewItem(
                        Icon(
                          Icons.today,
                          size: ScreenUtil().setSp(22),
                          color: Colors.white,
                        ),
                        Colors.blue,
                        'Today',
                        context.watch<HomePageProvider>().l1),
                  ),
                  GestureDetector(
                    onTap: () async
                    {await Navigator.pushNamed(context, RouteList.scheduledListScreen)
                        .whenComplete(()=>item.update());},
                    child: gridViewItem(
                        Icon(
                          Icons.calendar_today_sharp,
                          size: ScreenUtil().setSp(22),
                          color: Colors.white,
                        ),
                        Colors.red,
                        'Scheduled',
                        context.watch<HomePageProvider>().l2),
                  ),
                ]),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(15),
                left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
                bottom: ScreenUtil().setHeight(10),
              ),
              child: GestureDetector(
                onTap: () async
                {await Navigator.pushNamed(context, RouteList.allListScreen)
                    .whenComplete(()=>item.update());},
                child: gridViewItem(
                    Icon(
                      Icons.format_align_left,
                      size: ScreenUtil().setSp(22),
                      color: Colors.white,
                    ),
                    Colors.grey,
                    'All',
                    context.watch<HomePageProvider>().l3),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                  left: ScreenUtil().setWidth(20),
                  right: ScreenUtil().setWidth(10),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Lists',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(20),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(
                top: ScreenUtil().setHeight(10),
                left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
                bottom: ScreenUtil().setHeight(5),
              ),
              child:
              ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: context.watch<HomePageProvider>().MyLists.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: ()async {await Navigator.push(context,  MaterialPageRoute(builder:
                          (_)=> (listScreen(context,index)

                          ))).whenComplete(() => item.update());
                          },
                          child: Container(
                            margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            // alignment: Alignment.topLeft,
                            padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: context.watch<HomePageProvider>().MyLists[index].color,
                            ),
                            child: Icon(
                              Icons.list,
                              size: ScreenUtil().setSp(22),
                              color: Colors.white,
                            ),
                          ),
                      ),
                    ),
                    Expanded(
                      flex: 22,
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            context.watch<HomePageProvider>().MyLists[index].name,
                            // textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                      ),
                    ),
                    Expanded(
                          flex: 2,
                          child: Text(
                            '${context.watch<HomePageProvider>().MyLists[index].list.length}',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                                color: Colors.grey,
                                fontWeight: FontWeight.w600),
                          )),
                    Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: ScreenUtil().setSp(15),
                            color: Colors.grey,
                          )),
                  ],
                ),

                          ),
                        );}
              ),
            )
          ],
        ),
         // CreateNewReminder(),


      ),

      bottomNavigationBar: bottomBar(context),
    );
  }

  Widget gridViewItem(Icon icon, Color bgColor, String title, int count) {
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            //  crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    // alignment: Alignment.topLeft,
                    padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: bgColor,
                    ),
                    child: icon,
                  ),
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Text(
                    '${count}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(25),
                        fontWeight: FontWeight.w600),
                  ))
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                title,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(15),
                    color: Colors.grey,
                    fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(30),
          bottom: ScreenUtil().setHeight(15),
          left: ScreenUtil().setWidth(20),
          right: ScreenUtil().setWidth(20)),
      child: Container(
        height: ScreenUtil().setHeight(29),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        padding: EdgeInsets.only(
          bottom: ScreenUtil().setHeight(3),
          top: ScreenUtil().setHeight(3),
          left: ScreenUtil().setWidth(10),
        ),
        child: TextField(
            decoration: InputDecoration(
                // fillColor: Colors.blue,
                enabled: false,
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  size: ScreenUtil().setSp(25),
                ),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(15),
                ))),
      ),
    );
  }

  Widget bottomBar(BuildContext context) {
    //int value;
     Color listColor=Colors.blue;
    final item = Provider.of<HomePageProvider>(context);
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                  onTap: () async
                  {await Navigator.pushNamed(context, RouteList.createNewScreen)
                      .whenComplete(()=>
                      item.update()) ;
                  },
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(2)),
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: ScreenUtil().setSp(20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                      child: Text(
                        'New Reminder',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.blue),
                      ),
                    )
                  ]))),
          Expanded(
              child: GestureDetector(
                onTap: () async
            {await Navigator.pushNamed(context, RouteList.createNewList)
                .whenComplete(()=>
            item.update()) ;
            },
            child: Text(
              'Add List',
              textAlign: TextAlign.right,
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: ScreenUtil().setSp(15),
                  color: Colors.blue),
            ),
          ))
        ],
      ),
    );
  }

 // @override

}
