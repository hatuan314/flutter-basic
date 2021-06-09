import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:reminders_app/reminders_app/common/constants/layout_constants.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/bloc/homepage_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/homepage_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/widget/my_lists_widget.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/list/list_screen.dart';
import 'package:reminders_app/reminders_app/presentation/theme/theme.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/confirm_dialog.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/icon_slide_widget.dart';
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
        initialData:
            HomeState(l1: 0, l2: 0, l3: 0, MyLists: RemindersList.MyLists),
        stream: homeStream.homeStream,
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.grey.shade100,
            body: SafeArea(
              child: ListView(
                shrinkWrap: true,
                children: [
                  SearchBar(),
                  GridView(
                      padding: EdgeInsets.symmetric(
                        horizontal: LayoutConstants.paddingHorizontalItem,
                      ),
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
                          child: GridViewItem(
                              icon: HomePageConstant.iconToday,
                              bgColor: Colors.blue,
                              title: 'Today',
                              count: snapshot.data.l1),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Navigator.pushNamed(
                                    context, RouteList.scheduledListScreen)
                                .whenComplete(() => homeStream.update());
                          },
                          child: GridViewItem(
                              icon: HomePageConstant.iconScheduled,
                              bgColor: Colors.red,
                              title: 'Scheduled',
                              count: snapshot.data.l2),
                        ),
                      ]),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: LayoutConstants.paddingHorizontalItem,
                        vertical: LayoutConstants.paddingVerticalItem),
                    child: GestureDetector(
                      onTap: () async {
                        await Navigator.pushNamed(
                                context, RouteList.allListScreen)
                            .whenComplete(() => homeStream.update());
                      },
                      child: GridViewItem(
                          icon: HomePageConstant.iconAll,
                          bgColor: Colors.grey,
                          title: 'All',
                          count: snapshot.data.l3),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: LayoutConstants.paddingHorizontalApp,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My Lists',
                          style: ThemeText.headline2ListScreen
                              .copyWith(color: Colors.black),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: LayoutConstants.paddingHorizontalItem),
                    child:MyListsWidget(homeState:snapshot.data, homeStream: homeStream),
                  )
                ],
              ),
            ),
            bottomNavigationBar: BottomBar(context, homeStream: homeStream),
          );
        });
  }


}
