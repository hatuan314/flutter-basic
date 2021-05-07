import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/Schedule_Page/Provider_Scheduled.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:provider/provider.dart';

class stickyHeader extends StatelessWidget {
  var data;
  String ngay = '';
  DateTime _time = DateTime.now();
  stickyHeader({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    if (data[0]['time'][0]['date'].day == _time.day &&
        data[0]['time'][0]['date'].month == _time.month &&
        data[0]['time'][0]['date'].year == _time.year) {
      ngay = 'Hôm nay';
    } else if (data[0]['time'][0]['date'].day == _time.day + 1 &&
        data[0]['time'][0]['date'].month == _time.month &&
        data[0]['time'][0]['date'].year == _time.year) {
      ngay = 'Ngày mai';
    } else if (data[0]['time'][0]['date'].day == _time.day + 2 &&
        data[0]['time'][0]['date'].month == _time.month &&
        data[0]['time'][0]['date'].year == _time.year) {
      ngay = 'Ngày kia';
    } else if (data[0]['time'][0]['date'].day == _time.day - 1 &&
        data[0]['time'][0]['date'].month == _time.month &&
        data[0]['time'][0]['date'].year == _time.year) {
      ngay = 'Hôm qua';
    } else {
      ngay =
          'Th ${data[0]['time'][0]['date'].weekday} ${data[0]['time'][0]['date'].day} thg ${data[0]['time'][0]['date'].month}';
    }
    return StickyHeader(
      header: Container(
        height: ScreenUtil().setHeight(45),
        width: ScreenUtil().screenWidth,
        color: Colors.white,
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
        alignment: Alignment.centerLeft,
        child: Text(
          ngay,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(23)),
        ),
      ),
      content: Container(
        child: Column(
            children: List.generate(
                data.length,
                (index) => Row(
                      children: [
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Icon(
                          Icons.check_circle_outlined,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(
                                bottom: ScreenUtil().setHeight(10),
                                top: ScreenUtil().setHeight(10)),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(color: Colors.black45))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${data[index]['title']}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ScreenUtil().setSp(15)),
                                ),
                                SizedBox(
                                  height: ScreenUtil().setHeight(5),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Nhắc nhớ',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: ScreenUtil().setSp(15)),
                                    ),
                                    Visibility(
                                        visible:
                                            data[index]['time'][0]['time'] == ''
                                                ? false
                                                : true,
                                        child: Text(
                                          ' - ${data[index]['time'][0]['time'] == '' ? '' : '${data[index]['time'][0]['time'][0]}:${data[index]['time'][0]['time'][1]}'}',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: ScreenUtil().setSp(15)),
                                        ))
                                  ],
                                ),
                                Visibility(
                                    visible: data[index]['note'] == ''
                                        ? false
                                        : true,
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5),
                                        ),
                                        Text('${data[index]['note']}',
                                            style: TextStyle(
                                                color: Colors.black87
                                                    .withOpacity(0.6),
                                                fontSize:
                                                    ScreenUtil().setSp(14)))
                                      ],
                                    ))
                              ],
                            ),
                          ),
                        )
                      ],
                    ))),
        color: Colors.white,
      ),
    );
  }
}
