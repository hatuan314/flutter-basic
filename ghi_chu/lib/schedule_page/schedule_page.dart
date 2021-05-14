import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/schedule_page/provider_scheduled.dart';
import 'package:ghi_chu/schedule_page/widgets/sticky_header_widget.dart';
import 'package:provider/provider.dart';

class SchedulePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<SchedulePage> {
  List<TextEditingController> textEditing = [];
  String key;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
              child: Text(
                'Schedule',
                style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w900,
                    fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Column(
              children: List.generate(
                  Provider.of<ProviderSchedule>(context, listen: true)
                      .key1
                      .length, (index) {
                int indexReminder=0;
                return StickyHeaderWidget(
                  indexReminder: indexReminder,
                  title: Provider.of<ProviderSchedule>(context, listen: true)
                      .key1[index],
                  indexSticky: index,
                  controler: textEditing,
                );
              }),
            ),
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
              'Danh sách',
              style: TextStyle(
                  color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
            )
          ],
        ),
      ),
      leadingWidth: ScreenUtil().setHeight(100),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (int i = 0; i <ProviderSchedule().getKey(); i++) {
      textEditing.add(TextEditingController());
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProviderSchedule>().getKey();
    });
  }
}
