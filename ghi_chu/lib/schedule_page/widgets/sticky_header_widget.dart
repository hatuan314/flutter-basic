import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:intl/intl.dart';

class StickyHeaderWidget extends StatelessWidget {
  String title;

  StickyHeaderWidget({Key key, this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return StickyHeader(
        header: Container(
          height: ScreenUtil().setHeight(45),
          width: ScreenUtil().screenWidth,
          color: Colors.white,
          padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
          alignment: Alignment.centerLeft,
          child: Text(
            '${title}',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setSp(23)),
          ),
        ),
        content: Container(
          width: ScreenUtil().screenWidth,
          color: Colors.white,
          child: Column(
              // Text('${ModelListReminder.listReminder.values.elementAt(index)['${title}'][index1].title}');
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  ModelListReminder.listReminder.values.length, (index) {
                return Column(
                  children: List.generate(
                      ModelListReminder.listReminder.values
                                  .elementAt(index)['${title}'] ==
                              null
                          ? 0
                          : ModelListReminder.listReminder.values
                              .elementAt(index)['${title}']
                              .length, (index1) {
                    return Row(
                      children: [
                        Icon(Icons.check_circle_outline_outlined),
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
                                  bottom: BorderSide(color: Colors.black12))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${ModelListReminder.listReminder.values.elementAt(index)['${title}'][index1].title}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(16)),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(5),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${ModelListReminder.listReminder.values.elementAt(index)['${title}'][index1].group}',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: ScreenUtil().setSp(14)),
                                  ),
                                  Visibility(
                                      visible: ModelListReminder
                                          .listReminder.values
                                          .elementAt(index)['${title}'][index1]
                                          .time,
                                      child: Text(
                                        ' - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(ModelListReminder.listReminder.values.elementAt(index)['${title}'][index1].date))}',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: ScreenUtil().setSp(14)),
                                      ))
                                ],
                              ),
                              Visibility(
                                  visible: ModelListReminder.listReminder.values
                                              .elementAt(index)['${title}']
                                                  [index1]
                                              .note ==
                                          ''
                                      ? false
                                      : true,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: ScreenUtil().setHeight(5),
                                      ),
                                      Text(
                                        '${ModelListReminder.listReminder.values.elementAt(index)['${title}'][index1].note}',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: ScreenUtil().setSp(14)),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ))
                      ],
                    );
                  }),
                );
              })),
        ));
  }
}
