import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/bloc/all_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/bloc/all_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/widgets/sticky_header_widget.dart';

import 'package:ghichu/presentation/models/model_map.dart';

class AllPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<AllPage> {
  List<TextEditingController> listController = [];
  AllReminderBloc allReminderBloc = AllReminderBloc();
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
            StreamBuilder<AllReminderState>(
                stream: allReminderBloc.allController,
                builder: (context, snapshot) {
                  return Column(
                    children: List.generate(
                        ModelListReminder.listReminder.length, (index) {
                      int indexReminder = 0;
                      String keyGroup = ModelListReminder.myList.keys
                          .toList()
                          .elementAt(index);
                      return StickyReminderAll(
                        allReminderBloc: allReminderBloc,
                        indexReminder: indexReminder,
                        controller: listController,
                        indexHeader: index,
                        header: ModelListReminder.myList['$keyGroup'].title,
                        color: ModelListReminder.myList['$keyGroup'].color,
                        listReminderAll:
                            ModelListReminder.listReminder['$keyGroup'],
                      );
                    }),
                  );
                })
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

  @override
  void dispose() {
    // TODO: implement dispose
    allReminderBloc.dispose();
    super.dispose();
  }
}
