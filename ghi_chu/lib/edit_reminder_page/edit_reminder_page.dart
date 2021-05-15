import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/details/provider_details_page.dart';
import 'package:ghi_chu/details/widgets/time_widget.dart';
import 'package:ghi_chu/edit_reminder_page/edit_reminder.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/new_reminder/provider_reminder.dart';
import 'package:ghi_chu/new_reminder/widgets/list_reminders.dart';
import 'package:ghi_chu/new_reminder/widgets/title_note.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class EditReminderPage extends StatefulWidget {
  @override
  _EditReminderState createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminderPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  Map<String, dynamic> moDel;
  @override
  Widget build(BuildContext context) {
    moDel = ModalRoute.of(context).settings.arguments;
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
              'Hủy',
              style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(18)),
            )),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Chi tiết',
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
                      int h = Provider.of<ProviderDetailsPage>(context,
                                      listen: false)
                                  .hour *
                              60 *
                              60 *
                              1000 +
                          Provider.of<ProviderDetailsPage>(context,
                                      listen: false)
                                  .minuner *
                              60 *
                              1000;
                      int a;
                      if (Provider.of<ProviderDetailsPage>(context,
                              listen: false)
                          .date) {
                        if (Provider.of<ProviderDetailsPage>(context,
                                listen: false)
                            .time) {
                          a = DateTime.parse(DateFormat('yyyy-MM-dd').format(
                                      Provider.of<ProviderDetailsPage>(context,
                                              listen: false)
                                          .dateTime))
                                  .millisecondsSinceEpoch +
                              h;
                        } else {
                          a = DateTime.parse(DateFormat('yyyy-MM-dd').format(
                                  Provider.of<ProviderDetailsPage>(context,
                                          listen: false)
                                      .dateTime))
                              .millisecondsSinceEpoch;
                        }
                      }
                      EditReminder().editReminder(
                          titleController.text,
                          noteController.text,
                          Provider.of<ProviderReminder>(context, listen: false)
                              .group,
                          'none',
                          a,
                          moDel['createAt'],
                          DateTime.now().millisecondsSinceEpoch,
                          Provider.of<ProviderDetailsPage>(context,
                                  listen: false)
                              .time,
                          moDel);
                      Navigator.pop(context);
                    }
                  : null,
              child: Text(
                'Xong',
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(20),
              right: ScreenUtil().setWidth(20)),
          child: Column(
            children: [
              TitleNoteWidget(
                titleController: titleController,
                noteController: noteController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              TimeWidget(),
              ListReminder()
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      titleController.text = moDel['title'];
      noteController.text = moDel['note'];
      context.read<ProviderReminder>().bottonAdd(moDel['title']);
      if (moDel['date'] != null) {
        context
            .read<ProviderDetailsPage>()
            .dateScheldul(DateTime.fromMillisecondsSinceEpoch(moDel['date']));
        context.read<ProviderDetailsPage>().dateSwitch(true);
        Provider.of<ProviderDetailsPage>(context, listen: false).tableCalender =
            false;
        context.read<ProviderDetailsPage>().timeSwitch(moDel['time']);
      }
      int indexListGroup;
      for (int i = 0; i < ModelListReminder.myList.keys.length; i++) {
        if (ModelListReminder.myList.keys.elementAt(i) == moDel['group']) {
          indexListGroup = i;
          break;
        }
      }
      context.read<ProviderReminder>().setGroup(moDel['group'], indexListGroup);
    });
  }
}
