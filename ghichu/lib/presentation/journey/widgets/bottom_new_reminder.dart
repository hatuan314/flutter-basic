import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
class BottomNewReminder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.add_circle,
          color: Colors.blue,
        ),
        SizedBox(
          width: ScreenUtil().setWidth(6),
        ),
        Text(
          'New Reminder',
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(17)),
        )
      ],
    );
  }
}
