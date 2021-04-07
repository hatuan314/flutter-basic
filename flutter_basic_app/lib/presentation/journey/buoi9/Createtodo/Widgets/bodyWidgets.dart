import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/Createtodo/Widgets/ProvidesTitleNode.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/ProvidesTimer.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class bodyWidgets extends StatelessWidget {
  TimeOfDay pickedTime;
  TextEditingController textTitle = new TextEditingController();
  TextEditingController textnode = new TextEditingController();
  String time;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().screenHeight - ScreenUtil().setHeight(280),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
      child: Padding(
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(30),
            ScreenUtil().setHeight(50), ScreenUtil().setWidth(30), 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: textTitle,
                cursorColor: Colors.blue,
                decoration: InputDecoration(
                    errorText: context.watch<ProvidesTitleNode>().title == ''
                        ? 'Trường này không được bỏ trống'
                        : null,
                    border: new OutlineInputBorder(
                        borderSide:
                            new BorderSide(color: Colors.blue, width: 2)),
                    labelText: 'Title',
                    labelStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500),
                    hintStyle: TextStyle(
                        color: Colors.blue,
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500)),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(35),
              ),
              Container(
                  height: ScreenUtil().setHeight(200),
                  child: Theme(
                    data: ThemeData(
                      hintColor: Colors.blue,
                    ),
                    child: TextField(
                      controller: textnode,
                      maxLines: 200,
                      decoration: InputDecoration(
                          errorText:
                              context.watch<ProvidesTitleNode>().node == ''
                                  ? 'Trường này không được bỏ trống'
                                  : null,
                          border: new OutlineInputBorder(
                              borderSide:
                                  new BorderSide(color: Colors.blue, width: 2)),
                          labelText: 'Note',
                          labelStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: ScreenUtil().setSp(15),
                              fontWeight: FontWeight.w500),
                          hintStyle: TextStyle(
                              color: Colors.blue,
                              fontSize: ScreenUtil().setSp(15),
                              fontWeight: FontWeight.w500)),
                    ),
                  )),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Text(
                'Set time',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(18)),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              GestureDetector(
                onTap: () async {
                  TimeOfDay initialTime = TimeOfDay.now();
                  pickedTime = await showTimePicker(
                    context: context,
                    initialTime: initialTime,
                  );
                  context
                      .read<ProvidesTimer>()
                      .timer(pickedTime.hour, pickedTime.minute);
                  time = '${pickedTime.hour}:${pickedTime.minute}';
                },
                child: Container(
                  width: ScreenUtil().screenWidth,
                  height: ScreenUtil().setHeight(60),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(7))),
                  child: Text(
                    '${context.watch<ProvidesTimer>().hour}:${context.watch<ProvidesTimer>().minute}',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: ScreenUtil().setSp(20),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              SizedBox(
                width: double.infinity,
                height: ScreenUtil().setHeight(55),
                child: RaisedButton(
                  onPressed: () {
                    context
                        .read<ProvidesTitleNode>()
                        .timer(textTitle.text, textnode.text, time);
                    if (textTitle.text != '' && textnode.text != '') {
                      Scaffold.of(context).showSnackBar(SnackBar(
                        content: Text("Create succes"),
                        duration: Duration(seconds: 1),
                      ));
                    }
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  color: Colors.deepPurple,
                  child: Text(
                    'Save',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: ScreenUtil().setSp(20)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
