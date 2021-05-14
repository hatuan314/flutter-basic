import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/home_page/provider_home_page.dart';
import 'package:ghi_chu/home_page/widgets/edit_home_page.dart';

import 'package:ghi_chu/home_page/widgets/my_list_widget.dart';
import 'package:ghi_chu/home_page/widgets/search.dart';
import 'package:ghi_chu/home_page/widgets/wrap_widget.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/schedule_page/provider_scheduled.dart';
import 'package:ghi_chu/to_day_page/provider_to_day.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(15), 0,
            ScreenUtil().setWidth(15), ScreenUtil().setHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: Provider.of<ProviderHomePage>(context).edit
                  ? () async {
                      await Navigator.pushNamed(context, RouteList.newReminder)
                          .whenComplete(() {
                        context.read<ProviderHomePage>().update();
                      });
                    }
                  : null,
              child: Container(
                  margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                  child: Stack(
                    children: [
                      Visibility(
                        visible: context.watch<ProviderHomePage>().edit,
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle,
                              color: Colors.blue,
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(6),
                            ),
                            Text(
                              'New Reminder',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,
                                  fontSize: ScreenUtil().setSp(17)),
                            )
                          ],
                        ),
                      ),
                      Visibility(
                          visible: !Provider.of<ProviderHomePage>(context,
                                  listen: true)
                              .edit,
                          child: Text(
                            'Add Group',
                            style: TextStyle(
                                color: Colors.black26,
                                fontSize: ScreenUtil().setSp(20)),
                          ))
                    ],
                  )),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteList.newList).then((value) {
                  context.read<ProviderHomePage>().addList();
                  context.read<ProviderHomePage>().setLeght();
                });
              },
              child: Text(
                'Add List',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(18)),
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
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: Center(
                child: GestureDetector(
              onTap: () {
                context.read<ProviderHomePage>().setedit();
              },
              child: Text(
                context.watch<ProviderHomePage>().edit ? 'Edit' : 'Done',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setHeight(18)),
              ),
            )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                  width: ScreenUtil().screenWidth,
                  height: context.watch<ProviderHomePage>().edit
                      ? ScreenUtil().setHeight(280)
                      : ScreenUtil().setHeight(220),
                  color: Colors.transparent,
                  child: Stack(
                    children: [
                      WrapWidget(),
                      EditWidget(),
                    ],
                  )),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Text(
                  'My Lists',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20)),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Container(
                width: ScreenUtil().screenWidth,
                height: ModelListReminder.myList.length *
                    ScreenUtil().setHeight(60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white,
                ),
                child: ReorderableListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MyListWiget(
                        title: Provider.of<ProviderHomePage>(context,
                                listen: false)
                            .keyMyList[index],
                        color: ModelListReminder
                            .myList[
                                '${ModelListReminder.myList.keys.elementAt(index)}']
                            .color,
                        index: index,
                        key: Key("${index}"),
                      );
                    },
                    itemCount: ModelListReminder.myList.length,
                    onReorder: (int oldIndex, int newIndex) {
                      if (oldIndex < newIndex) {
                        newIndex -= 1;
                        context
                            .read<ProviderHomePage>()
                            .setButtonDelete(newIndex);
                      } else {
                        context
                            .read<ProviderHomePage>()
                            .setButtonDelete(newIndex);
                      }
                      var item =
                          Provider.of<ProviderHomePage>(context, listen: false)
                              .keyMyList
                              .removeAt(oldIndex);
                      Provider.of<ProviderHomePage>(context, listen: false)
                          .keyMyList
                          .insert(newIndex, item);
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
