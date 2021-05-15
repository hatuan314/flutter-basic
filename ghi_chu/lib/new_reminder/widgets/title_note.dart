import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/new_reminder/provider_reminder.dart';

class TitleNoteWidget extends StatelessWidget {
  TextEditingController titleController;
  TextEditingController noteController;
  TitleNoteWidget({Key key, this.titleController, this.noteController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
      width: double.infinity,
      height: ScreenUtil().setHeight(150),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Container(
            height: ScreenUtil().setHeight(45),
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.2))),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: ScreenUtil().setSp(17))),
              onChanged: (value) {
                context.read<ProviderReminder>().bottonAdd(value);
              },
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(5),
          ),
          Expanded(
            child: ListView(
              children: [
                TextField(
                  controller: noteController,
                  maxLines: null,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Notes',
                      hintStyle: TextStyle(fontSize: ScreenUtil().setSp(17))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
