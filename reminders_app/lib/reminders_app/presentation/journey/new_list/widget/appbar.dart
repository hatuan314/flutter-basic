import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminders_app/reminders_app/presentation/journey/new_list/list_stream.dart';
import '../../reminders_list.dart';

Widget appBar(
    BuildContext context, TextEditingController name, ListStream listStream) {
  return AppBar(
    elevation: 0,
    leadingWidth: ScreenUtil().screenWidth / 5,
    leading: GestureDetector(
      onTap: () => showDialog(
          context: context,
          builder: (_) => AlertDialog(title: Text('Cancel ?'), actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('No'),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  child: Text('Yes'),
                ),
              ])),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Cancel',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(15)),
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    centerTitle: true,
    title: Text(
      'New List',
      style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(16),
          fontWeight: FontWeight.w700),
    ),
    actions: [
      StreamBuilder(
        stream: listStream.clearButtonStream,
        initialData: false,
        builder: (context, snapshot) => (snapshot.data == false
            ? GestureDetector(
                onTap: () => {},
                child: Container(
                  //color: Colors.blue,
                  width: ScreenUtil().screenWidth / 6,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            : StreamBuilder(
                stream: listStream.colorStream,
                builder: (context, snapshot) => (GestureDetector(
                      onTap: () => {
                       // log(snapshot.hasData.toString()+snapshot.data.toString()),
                        RemindersList.addList(name.text,listStream.listColor),
                        Navigator.pop(context)
                      },
                      child: Container(
                        //color: Colors.blue,
                        width: ScreenUtil().screenWidth / 6,
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Add',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )))),
      )
    ],
  );
}