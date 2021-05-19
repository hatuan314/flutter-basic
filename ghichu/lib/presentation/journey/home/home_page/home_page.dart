import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc_home_page.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';
import 'package:ghichu/presentation/journey/home/home_page/widgets/edit_home_page.dart';
import 'package:ghichu/presentation/journey/home/home_page/widgets/my_list_widget.dart';
import 'package:ghichu/presentation/journey/home/home_page/widgets/search.dart';
import 'package:ghichu/presentation/journey/home/home_page/widgets/wrap_widget.dart';
import 'package:ghichu/presentation/journey/widgets/bottom_new_reminder.dart';
import 'package:ghichu/presentation/models/model_map.dart';
import 'package:reorderables/reorderables.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  BlocCheckButton blocCheckButton = new BlocCheckButton();
  BlocHomePage blocHomePage = new BlocHomePage();
  @override
  Widget build(BuildContext context) {
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
                  margin:
                      EdgeInsets.only(top: HomePageConstants.paddingHeight10),
                  child: Stack(
                    children: [
                      Visibility(visible: true, child: BottomNewReminder()),
                    ],
                  )),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteList.addList)
                      .whenComplete(() {
                    blocHomePage.getKey();
                  });
                },
                child: Text(
                  'Add List',
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
              padding: EdgeInsets.only(right: HomePageConstants.paddingWidth20),
              child: Center(
                  child: GestureDetector(
                onTap: () {
                  blocCheckButton.setCheck();
                },
                child: StreamBuilder<Object>(
                  stream: blocCheckButton.checkButtom,
                  builder: (context, snapshot) {
                    return Text(
                     blocCheckButton.check? 'Done':'Edit',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: HomePageConstants.screenUtileSp18),
                    );
                  }
                ),
              )),
            )
          ],
        ),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(HomePageConstants.paddingWidth20, 0,
                  HomePageConstants.paddingWidth20, 0),
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
                        'My Lists',
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
              padding: EdgeInsets.fromLTRB(HomePageConstants.paddingWidth20, 0,
                  HomePageConstants.paddingWidth20, 0),
              sliver: StreamBuilder<Object>(
                  stream: blocHomePage.groupController,
                  builder: (context, snapshot) {
                    return ReorderableSliverList(
                        delegate: ReorderableSliverChildListDelegate(
                            List.generate(blocHomePage.keyMyList.length,
                                (index) {
                          return MyListWidget(
                            title: ModelListReminder
                                .myList['${blocHomePage.keyMyList[index]}']
                                .title,
                            index: index,
                            leght: 0,
                            color: ModelListReminder
                                .myList['${blocHomePage.keyMyList[index]}']
                                .color,
                          );
                        })),
                        onReorder: (int oldIndex, int newIndex) {
                          var item = blocHomePage.keyMyList.removeAt(oldIndex);
                          blocHomePage.keyMyList.insert(newIndex, item);
                          blocHomePage.update();
                        });
                  }),
            )
          ],
        ));
  }

}