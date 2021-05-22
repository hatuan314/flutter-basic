import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/widgets/time_widget.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/widgets/list_group_widget.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/schedule_reminder/bloc/schedule_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/select_container.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/text_filed_title_note.dart';
import 'package:ghichu/presentation/models/model_map.dart';

import 'package:intl/intl.dart';

class EditReminderPage extends StatefulWidget {
  @override
  _EditReminderState createState() => _EditReminderState();
}

class _EditReminderState extends State<EditReminderPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  DetailsBloc detailsBloc = DetailsBloc();
  CheckButtonBloc checkButtonBloc = CheckButtonBloc();
  NewReminderBloc newReminderBloc = NewReminderBloc();
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
            child: StreamBuilder<Object>(
                stream: checkButtonBloc.checkButton,
                builder: (context, snapshot) {
                  return GestureDetector(
                    onTap: checkButtonBloc.check
                        ? () {
                            int h = detailsBloc.detailsState.hour *
                                    60 *
                                    60 *
                                    1000 +
                                detailsBloc.detailsState.minuner * 60 * 1000;
                            int a;
                            if (detailsBloc.detailsState.date) {
                              if (detailsBloc.detailsState.time) {
                                a = DateTime.parse(DateFormat('yyyy-MM-dd')
                                            .format(detailsBloc
                                                .detailsState.dateTime))
                                        .millisecondsSinceEpoch +
                                    h;
                              } else {
                                a = DateTime.parse(DateFormat('yyyy-MM-dd')
                                        .format(
                                            detailsBloc.detailsState.dateTime))
                                    .millisecondsSinceEpoch;
                              }
                            }
                            // EditReminder().editReminder(
                            //     titleController.text,
                            //     noteController.text,
                            //     Provider.of<ProviderReminder>(context, listen: false)
                            //         .group,
                            //     'none',
                            //     a,
                            //     moDel['createAt'],
                            // //     DateTime.now().millisecondsSinceEpoch,
                            // //     detailsBloc.detailsState.time,
                            //     moDel);
                            Navigator.pop(context);
                          }
                        : null,
                    child: Text(
                      'Xong',
                      style: TextStyle(
                          color: checkButtonBloc.check
                              ? Colors.blue
                              : Colors.black26,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(18)),
                    ),
                  );
                }),
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
                checkButtonBloc: checkButtonBloc,
                titleController: titleController,
                noteController: noteController,
              ),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              TimeWidget(
                detailsBloc: detailsBloc,
              ),
              StreamBuilder<NewReminderState>(
                  initialData: newReminderBloc.newReminderState,
                  stream: newReminderBloc.listGroupController,
                  builder: (context, snapshot) {
                    return SelectContainer(
                      title: 'Danh sách',
                      buttonDetails: false,
                      group: ModelListReminder
                          .myList['${snapshot.data.group}'].title,
                      color: Colors.blue.value.toString(),
                      onTap: () async {
                        // ScheduleReminderState scheduleReminderSate =
                        //     ScheduleReminderState(key1: []);
                        // // scheduleReminderSate.getKey();
                        // // print('${scheduleReminderSate.getKey()}');
                        // print('${snapshot.data.index}');
                        // Navigator.pushNamed(context, RouteList.listGroup,
                        //     arguments: {
                        //       'list': scheduleReminderSate.key1,
                        //       'index': snapshot.data.index
                        //     }).then((value) {
                        //   newReminderBloc.setGroup(
                        //       ModelListReminder.myList['${moDel[value]}'].title,
                        //       value);
                        // });
                      },
                    );
                  }),
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
      if (moDel['date'] != null) {
        detailsBloc.detailsState
            .dateScheldul(DateTime.fromMillisecondsSinceEpoch(moDel['date']));
        detailsBloc.detailsState.dateSwitch(true);
        detailsBloc.detailsState.tableCalender = false;
        detailsBloc.detailsState.timeSwitch(moDel['time']);
      }
      int indexListGroup;
      for (int i = 0; i < ModelListReminder.myList.keys.length; i++) {
        if (ModelListReminder.myList.keys.elementAt(i) == moDel['group']) {
          indexListGroup = i;
          break;
        }
      }
      newReminderBloc.newReminderState.setGroup(moDel['group'], indexListGroup);
      newReminderBloc.update();
      detailsBloc.update();
    });
  }
}
