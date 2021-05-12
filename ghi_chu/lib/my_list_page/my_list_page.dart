import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/reminder.dart';

import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
class MyListPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyListPage> {
  int lenghtToDay = 0;
Map moDel;
  @override
  Widget build(BuildContext context) {
    moDel=ModalRoute.of(context).settings.arguments;
    return GestureDetector(
      onTap: () {
        print('${moDel['color']}');
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${moDel['title']}',
                style: TextStyle(
                    color: Color(int.parse(moDel['color'])),
                    fontWeight: FontWeight.w800,
                    fontSize: ScreenUtil().setSp(30)),
              ),
              Column(
                children: List.generate(moDel['data'].values.length, (index1) {
                  //lay lenght cua tat ca time
                  return Column(
                      children: List.generate(
                          moDel['data'].values.elementAt(index1).length, (index) {
                        List<Reminder> reminder = moDel['data'].values.elementAt(index1);
                        return Row(
                          children: [
                            Icon(Icons.check_circle_outlined),
                            SizedBox(
                              width: ScreenUtil().setWidth(7),
                            ),
                            Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: ScreenUtil().setHeight(10)),
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(color: Colors.black26))),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${reminder[index].title}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: ScreenUtil().setSp(17)),
                                      ),
                                      Visibility(
                                          visible:
                                          reminder[index].date == null ? false : true,
                                          child: Text(reminder[index].date == null
                                              ? ''
                                              : reminder[index].time
                                              ? '${DateFormat('HH:mm,dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(reminder[index].date))}'
                                              : '${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(reminder[index].date))}')),
                                      Visibility(
                                          visible:
                                          reminder[index].note == '' ? false : true,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: ScreenUtil().setHeight(7),
                                              ),
                                              Text(
                                                '${reminder[index].note}',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: ScreenUtil().setSp(13)),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                ))
                          ],
                        );
                      }));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: ScreenUtil().setSp(20),
              color: Colors.blue,
            ),
            Text(
              'Danh sách',
              style: TextStyle(
                  color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
            )
          ],
        ),
      ),
      leadingWidth: ScreenUtil().setWidth(100),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {

    });
  }
}

