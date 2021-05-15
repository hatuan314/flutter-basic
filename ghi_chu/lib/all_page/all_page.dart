import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/all_page/prrovider_all_page.dart';
import 'package:ghi_chu/all_page/widgets/sticky_header_widget.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/model/reminder.dart';
import 'package:provider/provider.dart';

class AllPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AllPage> {
  List<TextEditingController> listController = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i < ModelListReminder.myList.length; i++) {
      listController.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: Text(
                'All',
                style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w900,
                    fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Column(
              children:
                  List.generate(ModelListReminder.listReminder.length, (index) {
                    int indexReminder=0;
                return StickyHeaderAll(
                  indexReminder: indexReminder,
                  indexHeader: index,
                  controller: listController,
                  header: context.watch<ProviderAllPage>().hedear =
                      ModelListReminder.listReminder.keys.elementAt(index),
                  conTent: ModelListReminder.listReminder[
                      '${ModelListReminder.listReminder.keys.elementAt(index)}'],
                  color: ModelListReminder
                      .myList[
                          '${ModelListReminder.listReminder.keys.elementAt(index)}']
                      .color,
                );
              }),
            )
          ],
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
              'Lists',
              style: TextStyle(
                  color: Colors.blue, fontSize: ScreenUtil().setSp(17)),
            )
          ],
        ),
      ),
      leadingWidth: ScreenUtil().setWidth(100),
    );
  }
}
