import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/bloc/reminder_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/widget/text_field.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/new_reminder_constants.dart';

class ReminderFormWidget extends StatelessWidget {
  final Function(String) onChangeTitle;
  final Function(String) onChangeNotes;

  const ReminderFormWidget(
      {Key key, this.onChangeTitle, this.onChangeNotes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        ScreenUtil().setWidth(10),
      ),
      child: Container(
          padding: EdgeInsets.all(ScreenUtil().setHeight(15)),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              TextFieldWidget(
                  hintText: NewReminderConstants.titleTxt,
                  maxLine: 1,
                  onChanged: onChangeTitle,),
              TextFieldWidget(
                  hintText: NewReminderConstants.notesTxt,
                  maxLine: 5,
                  onChanged: onChangeNotes)
            ],
          )),
    );
  }
}
