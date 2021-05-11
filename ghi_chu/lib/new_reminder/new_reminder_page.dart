import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/new_reminder/provider_reminder.dart';
import 'package:provider/provider.dart';
import 'Widgets/details_widget.dart';
import 'Widgets/list_reminders.dart';
import 'Widgets/title_note.dart';

class NewReminderPage extends StatefulWidget {
  @override
  _newReminderPageState createState() => _newReminderPageState();
}

class _newReminderPageState extends State<NewReminderPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
            child: Center(
                child: Text(
              'Cancel',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(18)),
            )),
          ),
        ),
        leadingWidth: ScreenUtil().setWidth(100),
        centerTitle: true,
        title: Text(
          'New Reminder',
          style: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(25),
              fontWeight: FontWeight.w600),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: context.watch<ProviderReminder>().button
                  ? () {
                      ProviderReminder().addTodoList(
                          context, titleController.text, noteController.text,Provider.of<ProviderReminder>(context,listen: false).valuesTime,Provider.of<ProviderReminder>(context,listen: false).group,'none',DateTime.now().millisecondsSinceEpoch,DateTime.now().millisecondsSinceEpoch,Provider.of<ProviderReminder>(context,listen: false).timeDetails);
                    }
                  : null,
              child: Text(
                'Add',
                style: TextStyle(
                    color: context.watch<ProviderReminder>().button
                        ? Colors.blue
                        : Colors.black26,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(18)),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleNoteWidget(
                titleController: titleController,
                noteController: noteController,
              ),
              DetailsWidget(
                title: titleController.text,
                node: noteController.text,
                button: context.watch<ProviderReminder>().button,
              ),
              ListReminder()
            ],
          ),
        ),
      ),
    );
  }


}
