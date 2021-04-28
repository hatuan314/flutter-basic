import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/Createtodo/Create_todo.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/Search_Page/search_page.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/home_Page/ProvidesBottom.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/home_Page/Schedule_Page/Schedule_Page.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';
class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  double witdh1 = ScreenUtil().setWidth(110),
      witdh2 = ScreenUtil().setWidth(55),
      witdh3 = ScreenUtil().setWidth(55),
      witdh4 = ScreenUtil().setWidth(55);
  int index = 0;
  double opacity1 = 1, opacity2 = 0, opacity3 = 0, opacity4 = 0;
  bool h1 = true, h2 = false, h3 = false, h4 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottonAppbat(),
      body: IndexedStack(
        index: index,
        children: [
          schedulePage(),
          searchPage(),
          createTodo(),
        ],
      ),
    );
  }

  Widget bottonAppbat() {
    return Container(
        height: ScreenUtil().setHeight(50),
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10,
              offset: Offset(0, -2))
        ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                witdh2 = ScreenUtil().setWidth(55);
                opacity2 = 0;
                h2 = false;
                witdh1 = ScreenUtil().setWidth(110);
                opacity1 = 1;
                h1 = true;
                witdh3 = ScreenUtil().setWidth(55);
                opacity3 = 0;
                h3 = false;
                witdh4 = ScreenUtil().setWidth(55);
                opacity4 = 0;
                h4 = false;
                index = 0;
                context.read<ProvidesBottom>().listen(
                    witdh1,
                    witdh2,
                    witdh3,
                    witdh4,
                    opacity1,
                    opacity2,
                    opacity3,
                    opacity4,
                    h1,
                    h2,
                    h3,
                    h4);
              },
              child: AnimatedContainer(
                width: context.watch<ProvidesBottom>().witdh1,
                height: ScreenUtil().setHeight(35),
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(15), 0, ScreenUtil().setWidth(15), 0),
                decoration: BoxDecoration(
                    color: Colors.red
                        .withOpacity(context.watch<ProvidesBottom>().opacity1),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                duration: Duration(milliseconds: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.wysiwyg,
                      size: ScreenUtil().setSp(20),
                      color: context.watch<ProvidesBottom>().h1
                          ? Colors.white
                          : Colors.black,
                    ),
                    Visibility(
                      visible: context.watch<ProvidesBottom>().h1,
                      child: Text(
                        'Schedule',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                witdh2 = ScreenUtil().setWidth(100);
                opacity2 = 1;
                h2 = true;
                witdh1 = ScreenUtil().setWidth(55);
                opacity1 = 0;
                h1 = false;
                witdh3 = ScreenUtil().setWidth(55);
                opacity3 = 0;
                h3 = false;
                witdh4 = ScreenUtil().setWidth(55);
                opacity4 = 0;
                h4 = false;
                index = 1;
                context.read<ProvidesBottom>().listen(
                    witdh1,
                    witdh2,
                    witdh3,
                    witdh4,
                    opacity1,
                    opacity2,
                    opacity3,
                    opacity4,
                    h1,
                    h2,
                    h3,
                    h4);
              },
              child: AnimatedContainer(
                width: context.watch<ProvidesBottom>().witdh2,
                height: ScreenUtil().setHeight(35),
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(15), 0, ScreenUtil().setWidth(15), 0),
                decoration: BoxDecoration(
                    color: Colors.yellow
                        .withOpacity(context.watch<ProvidesBottom>().opacity2),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                duration: Duration(milliseconds: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      size: ScreenUtil().setSp(20),
                      color: context.watch<ProvidesBottom>().h2
                          ? Colors.white
                          : Colors.black,
                    ),
                    Visibility(
                      visible: context.watch<ProvidesBottom>().h2,
                      child: Text(
                        'Search',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                witdh2 = ScreenUtil().setWidth(55);
                opacity2 = 0;
                h2 = false;
                witdh1 = ScreenUtil().setWidth(55);
                opacity1 = 0;
                h1 = false;
                witdh3 = ScreenUtil().setWidth(130);
                opacity3 = 1;
                h3 = true;
                witdh4 = ScreenUtil().setWidth(55);
                opacity4 = 0;
                h4 = false;
                index = 2;
                context.read<ProvidesBottom>().listen(
                    witdh1,
                    witdh2,
                    witdh3,
                    witdh4,
                    opacity1,
                    opacity2,
                    opacity3,
                    opacity4,
                    h1,
                    h2,
                    h3,
                    h4);
              },
              child: AnimatedContainer(
                width: context.watch<ProvidesBottom>().witdh3,
                height: ScreenUtil().setHeight(35),
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(15), 0, ScreenUtil().setWidth(15), 0),
                decoration: BoxDecoration(
                    color: Colors.blue
                        .withOpacity(context.watch<ProvidesBottom>().opacity3),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                duration: Duration(milliseconds: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: ScreenUtil().setSp(20),
                      color: context.watch<ProvidesBottom>().h3
                          ? Colors.white
                          : Colors.black,
                    ),
                    Visibility(
                      visible: context.watch<ProvidesBottom>().h3,
                      child: Text(
                        'Create Todo',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                witdh2 = ScreenUtil().setWidth(55);
                opacity2 = 0;
                h2 = false;
                witdh1 = ScreenUtil().setWidth(55);
                opacity1 = 0;
                h1 = false;
                witdh3 = ScreenUtil().setWidth(55);
                opacity3 = 0;
                h3 = false;
                witdh4 = ScreenUtil().setWidth(110);
                opacity4 = 1;
                h4 = true;
                context.read<ProvidesBottom>().listen(
                    witdh1,
                    witdh2,
                    witdh3,
                    witdh4,
                    opacity1,
                    opacity2,
                    opacity3,
                    opacity4,
                    h1,
                    h2,
                    h3,
                    h4);
              },
              child: AnimatedContainer(
                width: context.watch<ProvidesBottom>().witdh4,
                height: ScreenUtil().setHeight(35),
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(15), 0, ScreenUtil().setWidth(15), 0),
                decoration: BoxDecoration(
                    color: Colors.red
                        .withOpacity(context.watch<ProvidesBottom>().opacity4),
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                duration: Duration(milliseconds: 400),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.wysiwyg,
                      size: ScreenUtil().setSp(20),
                      color: context.watch<ProvidesBottom>().h4
                          ? Colors.white
                          : Colors.black,
                    ),
                    Visibility(
                      visible: context.watch<ProvidesBottom>().h4,
                      child: Text(
                        'Schedule',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(12)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
