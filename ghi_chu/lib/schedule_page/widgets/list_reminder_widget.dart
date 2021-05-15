import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:ghi_chu/schedule_page/provider_scheduled.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ListReminderSchedule extends StatelessWidget {
  String group, title, note, keyDate;
  int date;
  bool time;
  int indexSticky;
  int index;
  int createAt;
  Reminder reminder;
  List<TextEditingController> controller;
  ListReminderSchedule(
      {Key key,
      this.group,
      this.title,
      this.note,
      this.date,
      this.time,
      this.indexSticky,
      this.index,
      this.controller,
      this.keyDate,
      this.createAt,
      this.reminder})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProviderSchedule>().setIndexReminder(index, indexSticky);
        Provider.of<ProviderSchedule>(context, listen: false).indexSticky =
            null;
        for (int i = 0; i < ProviderSchedule().getKey(); i++) {
          if (controller[i].text != '') {
            Provider.of<ProviderSchedule>(context, listen: false).addReminder(
                controller[i],
                controller[i].text,
                ModelListReminder.myList.keys.elementAt(0));
            controller[i].text = '';
          }
        }
      },
      child: Row(
        children: [
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
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
                border: Border(bottom: BorderSide(color: Colors.black12))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${title}',
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(16)),
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(5),
                ),
                Row(
                  children: [
                    Text(
                      '${group}',
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: ScreenUtil().setSp(14)),
                    ),
                    Visibility(
                        visible: time,
                        child: Text(
                          ' - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(date))}',
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: ScreenUtil().setSp(14)),
                        ))
                  ],
                ),
                Visibility(
                    visible: note == '' ? false : true,
                    child: Column(
                      children: [
                        SizedBox(
                          height: ScreenUtil().setHeight(5),
                        ),
                        Text(
                          '${note}',
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: ScreenUtil().setSp(14)),
                        )
                      ],
                    ))
              ],
            ),
          )),
          Visibility(
              visible: indexSticky ==
                      context.watch<ProviderSchedule>().indexStickyReminder
                  ? index == context.watch<ProviderSchedule>().indexReminder
                      ? true
                      : false
                  : false,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, RouteList.editReminder,
                      arguments: {
                        'group': group,
                        'title': title,
                        'note': note,
                        'date': date,
                        'time': time,
                        'createAt': createAt,
                        'reminder': reminder
                      }).whenComplete(() {
                    Provider.of<ProviderSchedule>(context, listen: false).key1 =
                        [];
                    Provider.of<ProviderSchedule>(context, listen: false)
                        .addTextEditing();
                    context.read<ProviderSchedule>().getKey();
                  });
                },
                child: Icon(
                  Icons.error_outline,
                  size: ScreenUtil().setSp(23),
                  color: Colors.red,
                ),
              )),
          SizedBox(
            width: ScreenUtil().setWidth(20),
          )
        ],
      ),
    );
  }
}
