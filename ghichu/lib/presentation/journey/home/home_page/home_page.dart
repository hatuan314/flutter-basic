import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/common/constants/route_constants.dart';

import 'package:ghichu/common/setting_argument/settting_argument.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_event.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_state.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';
import 'package:ghichu/presentation/journey/home/home_page/widgets/edit_home_page.dart';
import 'package:ghichu/presentation/journey/home/home_page/widgets/my_list_widget.dart';
import 'package:ghichu/presentation/journey/home/home_page/widgets/search.dart';
import 'package:ghichu/presentation/journey/home/home_page/widgets/wrap_widget.dart';
import 'package:ghichu/presentation/journey/widgets/bottom_new_reminder.dart';
import 'package:reorderables/reorderables.dart';
import 'bloc/home_page_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  CheckButtonBloc blocCheckButton = new CheckButtonBloc();
  bool updateOrder = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<HomePageBloc>(context).add(UpDate());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomePageBloc, HomePageState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white.withOpacity(0.95),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.fromLTRB(
                  HomePageConstants.paddingWidth15,
                  0,
                  HomePageConstants.paddingWidth15,
                  HomePageConstants.paddingHeight20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      margin: EdgeInsets.only(
                          top: HomePageConstants.paddingHeight10),
                      child: Stack(
                        children: [
                          Visibility(
                              visible: true,
                              child: BottomNewReminder(
                                onTap: () {
                                  Navigator.pushNamed(
                                          context, RouteList.newReminder,
                                          arguments: SettingNewReminder(
                                              listGroup: state.keyMyList,
                                              isEditReminder: false))
                                      .whenComplete(() {
                                    BlocProvider.of<HomePageBloc>(context)
                                        .add(UpDate());
                                  });
                                },
                              )),
                        ],
                      )),
                  GestureDetector(
                    onTap: () async {
                      await Navigator.pushNamed(context, RouteList.addGroup);
                      BlocProvider.of<HomePageBloc>(context).add(UpDate());
                    },
                    child: Text(
                      HomePageConstants.addListTxt,
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: HomePageConstants.screenUtileSp18),
                    ),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: SizedBox(),
              actions: [
                Padding(
                  padding:
                      EdgeInsets.only(right: HomePageConstants.paddingWidth20),
                  child: Center(
                      child: GestureDetector(
                    onTap: () {
                      blocCheckButton.setCheck();
                    },
                    child: StreamBuilder<Object>(
                        stream: blocCheckButton.checkButton,
                        builder: (context, snapshot) {
                          return Text(
                            blocCheckButton.check
                                ? HomePageConstants.doneTxt
                                : HomePageConstants.editTxt,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w600,
                                fontSize: HomePageConstants.screenUtileSp18),
                          );
                        }),
                  )),
                )
              ],
            ),
            body: CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(HomePageConstants.paddingWidth20,
                      0, HomePageConstants.paddingWidth20, 0),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        SearchWidget(),
                        Stack(
                          children: [
                            WrapWidget(
                              blocCheckButton: blocCheckButton,
                            ),
                            EditWidget(
                              blocCheckButton: blocCheckButton,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: HomePageConstants.paddingHeight10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: HomePageConstants.paddingHeight10,
                              left: HomePageConstants.paddingWidth10),
                          child: Text(
                            HomePageConstants.myListTxt,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: HomePageConstants.screenUtileSp20),
                          ),
                        ),
                        SizedBox(
                          height: HomePageConstants.paddingHeight10,
                        ),
                      ],
                    ),
                  ),
                ),
                SliverPadding(
                    padding: EdgeInsets.fromLTRB(
                        HomePageConstants.paddingWidth20,
                        0,
                        HomePageConstants.paddingWidth20,
                        0),
                    sliver: ReorderableSliverList(
                        delegate: ReorderableSliverChildListDelegate(
                            List.generate(state.keyMyList.length, (index) {
                          return MyListWidget(
                            title: state.keyMyList[index].name,
                            index: index,
                            state: state,
                            leght: 0,
                            color: state.keyMyList[index].color,
                          );
                        })),
                        onReorder: (int oldIndex, int newIndex) {
                          if (newIndex != oldIndex) {
                            updateOrder = !updateOrder;
                            var item = state.keyMyList.removeAt(oldIndex);
                            state.keyMyList.insert(newIndex, item);
                            BlocProvider.of<HomePageBloc>(context).add(
                                OrderGroup(
                                    listGroup: state.keyMyList,
                                    updateOrder: updateOrder));
                          }
                        }))
              ],
            ));
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // blocHomePage.dispose();
    blocCheckButton.dispose();
    print('33243');
    super.dispose();
  }
}
