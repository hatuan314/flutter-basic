import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/list_reminder/prrovider_list_reminder_page.dart';
import 'package:ghi_chu/list_reminder/widgets/list_reminder_widget.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:provider/provider.dart';
class ListReminderPage extends StatefulWidget {
  @override
  _ListReminderpageState createState() => _ListReminderpageState();
}

class _ListReminderpageState extends State<ListReminderPage> {
  int indexCheck;
  @override
  Widget build(BuildContext context) {
    indexCheck=ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
                size: ScreenUtil().setSp(21),
                color: Colors.blue,
              ),
              Text(
                'Lời nhắc mới',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
              )
            ],
          ),
        ),
        leadingWidth: ScreenUtil().setWidth(130),
        title: Text(
          'Danh sách',
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(18)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: List.generate(ModelListReminder.myList.length, (index) {
          return ListReminderWidget(
            title: ModelListReminder.myList.keys.elementAt(index),
            color: ModelListReminder
                .myList['${ModelListReminder.myList.keys.elementAt(index)}']
                .color,
            index: index,
          );
        }),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProviderListReminderPage>().setindexCheck(indexCheck);
    });
  }
}
