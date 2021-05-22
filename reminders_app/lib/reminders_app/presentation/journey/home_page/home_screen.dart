import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/bloc/homepage_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/list/list_screen.dart';
import 'bloc/home_state.dart';

import '../reminders_list.dart';
import 'widget/bottom_navigation_bar.dart';
import 'widget/grid_view_item.dart';
import 'widget/search_bar.dart';

class B10HomeScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _B10HomeScreen();
}

class _B10HomeScreen extends State<B10HomeScreen> {


  final TextEditingController textName = TextEditingController();
  HomeStream homeStream = HomeStream();
  @override
  void dispose() {
homeStream.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    RemindersList.addDefaultList();
   // homeStream.update();
    return StreamBuilder<HomeState>(
      initialData: HomeState(l1: 0,l2: 0,l3: 0,MyLists: RemindersList.MyLists),
      stream: homeStream.homeStream,
      builder: (context, snapshot) {
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
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, RouteList.todayListScreen)
                              .whenComplete(() => homeStream.update());
                        },
                        child: gridViewItem(
                            Icon(
                              Icons.today,
                              size: ScreenUtil().setSp(22),
                              color: Colors.white,
                            ),
                            Colors.blue,
                            'Today',
                            snapshot.data.l1),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await Navigator.pushNamed(
                              context, RouteList.scheduledListScreen)
                              .whenComplete(() => homeStream.update());
                        },
                        child: gridViewItem(
                            Icon(
                              Icons.calendar_today_sharp,
                              size: ScreenUtil().setSp(22),
                              color: Colors.white,
                            ),
                            Colors.red,
                            'Scheduled',
                            snapshot.data.l2),
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
                    onTap: () async {
                      await Navigator.pushNamed(context, RouteList.allListScreen)
                          .whenComplete(() => homeStream.update());
                    },
                    child: gridViewItem(
                        Icon(
                          Icons.format_align_left,
                          size: ScreenUtil().setSp(22),
                          color: Colors.white,
                        ),
                        Colors.grey,
                        'All',
                        snapshot.data.l3),
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
                  child:myListWidget(snapshot.data),
                )
              ],
            ),
            // CreateNewReminder(),
          ),
          bottomNavigationBar: bottomBar(context,homeStream),
        );
      }
    );
  }

 Widget myListWidget(HomeState homeState)
 {
   return ListView.builder(
       scrollDirection: Axis.vertical,
       shrinkWrap: true,
       itemCount: homeState.MyLists.length==null?1:homeState.MyLists.length,
       itemBuilder: (context, index) {
         return Slidable(
           closeOnScroll: true,
           actionPane: SlidableDrawerActionPane(),
           secondaryActions: [
             IconSlideAction(
               caption: 'Edit',
               iconWidget: Icon(
                 Icons.edit,
                 color: Colors.white,
               ),
               color: Colors.blue,
               onTap: () => {},
             ),
             IconSlideAction(
               caption: 'Delete',
               iconWidget: Icon(
                 Icons.delete,
                 color: Colors.white,
               ),
               color: Colors.red,
               onTap: () => {
                 RemindersList.MyLists[index].name == 'Reminders'
                     ? showDialog(
                     context: context,
                     builder: (_) => AlertDialog(
                         title: Text(
                           'Default list cannot be deleted',
                           style: TextStyle(
                               fontSize: ScreenUtil()
                                   .setSp(15)),
                         ),
                         actions: [
                           FlatButton(
                             onPressed: () {
                               Navigator.pop(context);
                             },
                             child: Text('OK'),
                           )
                         ]))
                     : showDialog(
                     context: context,
                     builder: (_) => AlertDialog(
                       title: Text('Delete ?'),
                       actions: [
                         FlatButton(
                           onPressed: () {
                             Navigator.pop(context);
                           },
                           child: Text('Cancel'),
                         ),
                         FlatButton(
                           onPressed: () {
                             for (int j = 0;
                             j <
                                 RemindersList
                                     .MyLists[index]
                                     .list
                                     .length;
                             j++) {
                               RemindersList.allReminders
                                   .forEach(
                                       (key, value) {
                                     for (int i = 0;
                                     i < value.length;
                                     i++) {
                                       if (value[i].id ==
                                           RemindersList
                                               .MyLists[
                                           index]
                                               .list[i]
                                               .id) {
                                         value.removeAt(i);
                                         i--;
                                       }
                                     }
                                   });
                             }
                             ;
                             RemindersList.MyLists
                                 .removeAt(index);
                             index--;
                             homeStream.update();
                             Navigator.pop(context);
                           },
                           child: Text('OK'),
                         ),
                       ],
                     )),
               },
             )
           ],
           actionExtentRatio: 0.2,
           child: GestureDetector(
             onTap: () async {
               await Navigator.push(
                   context,
                   MaterialPageRoute(
                       builder: (_) =>
                       (listScreen(context, index))))
                   .whenComplete(() => homeStream.update());
             },
             child: Container(
               margin: EdgeInsets.all(ScreenUtil().setWidth(10)),
               padding:
               EdgeInsets.all(ScreenUtil().setWidth(10)),
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
                         padding: EdgeInsets.all(
                             ScreenUtil().setWidth(5)),
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: homeState.MyLists[index].color,
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
                         homeState.MyLists[index].name,
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
                         '${homeState.MyLists[index].list.length}',
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
           ),

         );
       });
 }
}
