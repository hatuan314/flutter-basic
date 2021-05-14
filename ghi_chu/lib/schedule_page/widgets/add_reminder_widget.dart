import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/schedule_page/provider_scheduled.dart';
import 'package:provider/provider.dart';

class AddReminder extends StatelessWidget {
  int index;
  int oldIndex;
  List<TextEditingController> controller;
  String keyDate;
  AddReminder({Key key, this.index, this.controller, this.keyDate})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (h) {
        context.read<ProviderSchedule>().indexSticky = null;
        context.read<ProviderSchedule>().addReminder(controller[index],
            controller[index].text, ModelListReminder.myList.keys.elementAt(0));
      },
      style: TextStyle(fontSize: ScreenUtil().setSp(16)),
      controller: controller[index],
      onTap: () {
        Provider.of<ProviderSchedule>(context, listen: false).indexReminder =
            null;
        oldIndex =
            Provider.of<ProviderSchedule>(context, listen: false).indexSticky;
        context.read<ProviderSchedule>().setFoucs(index);
        try {
          if (oldIndex !=
              Provider.of<ProviderSchedule>(context, listen: false)
                  .indexSticky) {
            context.read<ProviderSchedule>().addReminder(
                controller[oldIndex],
                controller[oldIndex].text,
                ModelListReminder.myList.keys.elementAt(0));
          }
        } catch (_) {}
        Provider.of<ProviderSchedule>(context, listen: false).keyDate = keyDate;
      },
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1),
        ),
        suffixIcon: Visibility(
            visible: index == context.watch<ProviderSchedule>().indexSticky
                ? true
                : false,
            child: Icon(
              Icons.error_outline,
              size: ScreenUtil().setSp(23),
              color: Colors.red,
            )),
        prefixIcon: Icon(
          Icons.add_circle_outlined,
          size: ScreenUtil().setSp(25),
          color: Colors.black45,
        ),
        helperText: index == context.watch<ProviderSchedule>().indexSticky
            ? "${ModelListReminder.myList.keys.elementAt(0)}"
            : '',
        helperStyle:
            TextStyle(color: Colors.black45, fontSize: ScreenUtil().setSp(13)),
      ),
    );
  }
}
