import 'dart:ui';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/home_page/provider_home_page.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/schedule_page/provider_scheduled.dart';
import 'package:ghi_chu/to_day_page/provider_to_day.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyListWiget extends StatelessWidget {
  String color;
  int index;
  String title;
  int index1;
  MyListWiget({Key key, this.color, this.title, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
            top: ScreenUtil().setHeight(60 / 2 - 25 / 2),
            left: context.watch<ProviderHomePage>().edit
                ? -ScreenUtil().setSp(25)
                : ScreenUtil().setSp(12),
            child: GestureDetector(
                onTap: () {
                  index1 = index;

                  context.read<ProviderHomePage>().setButtonDelete(index);
                },
                child: Icon(
                  Icons.remove_circle,
                  size: ScreenUtil().setSp(25),
                  color: Colors.red,
                )),
            duration: Duration(milliseconds: 240)),
        Row(
          children: [
            AnimatedContainer(
                width: context.watch<ProviderHomePage>().edit
                    ? 00
                    : ScreenUtil().setWidth(35),
                duration: Duration(milliseconds: 239)),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteList.myListPage,
                      arguments: {
                        'title': title,
                        "data": ModelListReminder.listReminder['${title}'],
                        'color': color
                      });
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(30),
                      height: ScreenUtil().setWidth(30),
                      decoration: BoxDecoration(
                          color: Color(int.parse(color)),
                          shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        Icons.list,
                        color: Colors.white,
                        size: ScreenUtil().setSp(22),
                      )),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(15),
                    ),
                    Expanded(
                      child: Container(
                        height: ScreenUtil().setHeight(60),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: index ==
                                            Provider.of<ProviderHomePage>(
                                                        context,
                                                        listen: false)
                                                    .keyMyList
                                                    .length -
                                                1
                                        ? Colors.transparent
                                        : Colors.black12))),
                        child: Row(
                          children: [
                            Text(
                              '${title}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: ScreenUtil().setSp(18)),
                            ),
                            Expanded(
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    '${context.watch<ProviderHomePage>().myListLeght['${context.watch<ProviderHomePage>().keyMyList[index]}']}',
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: ScreenUtil().setSp(16)),
                                  )),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.navigate_next_outlined,
                                color: Colors.black26,
                                size: ScreenUtil().setSp(20),
                              ),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(5),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: !context.watch<ProviderHomePage>().edit,
              child: GestureDetector(
                onTap: () {
                  if (title == 'Reminder') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Không thể xóa mục này",
                        style: TextStyle(fontSize: ScreenUtil().setSp(15)),
                      ),
                    ));
                  } else {
                    if (Provider.of<ProviderHomePage>(context, listen: false)
                            .myListLeght['${title}'] ==
                        0) {
                      ModelListReminder.listReminder.remove(title);
                      ModelListReminder.myList.remove('${title}');
                      Provider.of<ProviderHomePage>(context, listen: false)
                          .keyMyList
                          .remove(title);
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                                title: Center(
                                    child: Text(
                                  "Xóa'${title}'?",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(16)),
                                )),
                                content: Text(
                                  'Việc này sẽ xóa tất cả lời nhắc trong danh sách này',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(15)),
                                ),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text(
                                      'Hủy',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: ScreenUtil().setSp(17)),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    child: Text(
                                      'Xóa',
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: ScreenUtil().setSp(16)),
                                    ),
                                    onPressed: () {
                                      ModelListReminder.listReminder
                                          .remove(title);
                                      ModelListReminder.myList
                                          .remove('${title}');
                                      Provider.of<ProviderHomePage>(context,
                                              listen: false)
                                          .keyMyList
                                          .remove(title);
                                      context
                                          .read<ProviderHomePage>()
                                          .setLeght();
                                      for (int i = 0;
                                          i < ConstHomePage.list.length;
                                          i++) {
                                        if (ConstHomePage.list[i]['title'] ==
                                            'Today') {
                                          ConstHomePage.list[i]['sum'] =
                                              ProviderToday().getToday();
                                        } else if (ConstHomePage.list[i]
                                                ['title'] ==
                                            'Scheduled') {
                                          ConstHomePage.list[i]['sum'] =
                                              ProviderSchedule().getKey();
                                        } else if (ConstHomePage.list[i]
                                                ['title'] ==
                                            'All') {
                                          ConstHomePage.list[i]['sum'] =
                                              Provider.of<ProviderHomePage>(
                                                      context,
                                                      listen: false)
                                                  .leghtAll;
                                        }
                                      }
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ));
                    }
                  }

                  context.read<ProviderHomePage>().update();
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  height: ScreenUtil().setHeight(60),
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: context.watch<ProviderHomePage>().index == 0
                          ? BorderRadius.only(topRight: Radius.circular(7))
                          : context.watch<ProviderHomePage>().index ==
                                  context
                                          .watch<ProviderHomePage>()
                                          .keyMyList
                                          .length -
                                      1
                              ? BorderRadius.only(
                                  bottomRight: Radius.circular(7))
                              : null),
                  width: index == context.watch<ProviderHomePage>().index
                      ? ScreenUtil().setWidth(70)
                      : 0,
                  duration: Duration(milliseconds: 239),
                  child: Text('Xóa',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(16)),
                      softWrap: false),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
