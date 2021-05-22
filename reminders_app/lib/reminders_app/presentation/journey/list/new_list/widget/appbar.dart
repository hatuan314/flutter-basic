import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/create_list_state.dart';


Widget appBar(
    BuildContext context, {
      TextEditingController name,
      CreateListState createListState,
      Function(String, Color) onDone,
    }) {
  return AppBar(
    elevation: 0,
    leadingWidth: ScreenUtil().screenWidth / 5,
    leading:cancelButton(context),
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
    addButton(context,name: name, createListState: createListState,onDone: onDone),
    ],
  );
}
Widget cancelButton(BuildContext context)
{
  return  GestureDetector(
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
  );
}
Widget addButton(
    BuildContext context, {
      TextEditingController name,
      CreateListState createListState,
      Function(String, Color) onDone,
    })
{
  return   GestureDetector(
    onTap: () {
      if (createListState.clearButton) {
        onDone(name.text, createListState.listColor);
        Navigator.pop(context);
      }
    },
    child: Container(
      width: ScreenUtil().screenWidth / 6,
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'Add',
          style: TextStyle(
              color:
              createListState.clearButton ? Colors.blue : Colors.grey,
              fontSize: ScreenUtil().setSp(15),
              fontWeight: FontWeight.w600),
        ),
      ),
    ),
  );
}