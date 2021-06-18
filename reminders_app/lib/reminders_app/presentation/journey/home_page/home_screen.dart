import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:reminders_app/common/constants/color_constants.dart';
import 'package:reminders_app/reminders_app/domain/entities/group.dart';
import 'package:reminders_app/reminders_app/theme/theme.dart';
import '../../../../common/constants/layout_constants.dart';
import '../../../../common/constants/route_constants.dart';
import 'bloc/homepage_bloc.dart';
import 'bloc/homepage_event.dart';
import 'homepage_constants.dart';
import 'widget/my_lists_widget.dart';
import 'bloc/home_state.dart';
import '../../../../common/extensions/date_extensions.dart';
import '../reminders_list.dart';
import 'widget/bottom_navigation_bar.dart';
import 'widget/grid_view_item.dart';
import 'widget/search_bar.dart';

class  HomeScreen extends StatefulWidget {
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State< HomeScreen> {
  final TextEditingController textName = TextEditingController();
  //HomeStream homeStream = HomeStream();

  @override
  void dispose() {
  //  homeStream.dispose();
    super.dispose();
  }
  Future addDefaultList()
  {
   /* final box= Boxes.getGroup();
    if(box.isEmpty) {
      final g = Group()
        ..name = 'Reminders'
        ..color = Colors.blue
        ..createAt = DateTime
            .now()
            .dateDdMMyyyy
        ..lastUpdate = DateTime
            .now()
            .dateDdMMyyyy;
      box.add(g);
      log('added default list');
    }*/
  }
  @override
  Widget build(BuildContext context) {
    RemindersList.addDefaultList();
     BlocProvider.of<HomeBloc>(context).add(UpdateEvent());
    return BlocBuilder<HomeBloc,HomeState>(
      builder: (context, state)
    {
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
                                .whenComplete(() => BlocProvider.of<HomeBloc>(context).add(UpdateEvent()));
                          },
                          child: GridViewItem(
                              icon: HomePageConstant.iconToday,
                              bgColor: Colors.blue,
                              title: 'Today',
                              count: state.todayListLength),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await Navigator.pushNamed(
                                    context, RouteList.scheduledListScreen)
                                .whenComplete(() => BlocProvider.of<HomeBloc>(context).add(UpdateEvent()));
                          },
                          child: GridViewItem(
                              icon: HomePageConstant.iconScheduled,
                              bgColor: Colors.red,
                              title: 'Scheduled',
                              count: state.scheduledListLength),
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
                            .whenComplete(() => BlocProvider.of<HomeBloc>(context).add(UpdateEvent( )));
                      },
                      child: GridViewItem(
                          icon: HomePageConstant.iconAll,
                          bgColor: Colors.grey,
                          title: 'All',
                          count: state.allListLength),
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
                    child:ListView.builder(
                        shrinkWrap: true,
                        itemCount:  state.myLists.length,
                        itemBuilder: (context, index) {
                          log(state.myLists[index].name);
                          return MyListsWidget(color: ColorConstants.colorMap[state.myLists[index].color], name: state.myLists[index].name , index: index, length: state.myLists[index].list.length);
                        }),
                    )
                                  ],
              ),
            ),
            bottomNavigationBar: BottomBar(context ),
          );
        });
  }


}
