import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';

import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/select_container.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/text_filed_title_note.dart';
import 'package:ghichu/presentation/journey/widgets/app_bar.dart';
import 'package:ghichu/presentation/journey/widgets/show_model_button_sheet.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class NewReminderPage extends StatefulWidget {
  @override
  _newReminderPageState createState() => _newReminderPageState();
}

class _newReminderPageState extends State<NewReminderPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  CheckButtonBloc checkButtonBloc = CheckButtonBloc();
  NewReminderBloc newReminderBloc = NewReminderBloc();
  @override
  Widget build(BuildContext context) {
    List<String> moDel = ModalRoute.of(context).settings.arguments;
    newReminderBloc.newReminderState.group =
        ModelListReminder.myList['${moDel[0]}'].title;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBarWidget(
        blocCheckButton: checkButtonBloc,
        actions: () {
          newReminderBloc.newReminderState.addTodoList(
              titleController.text,
              noteController.text,
              newReminderBloc.newReminderState.valuesTime,
             moDel[newReminderBloc.newReminderState.index],
              'none',
              DateTime.now().millisecondsSinceEpoch,
              DateTime.now().millisecondsSinceEpoch,
              newReminderBloc.newReminderState.timeDetails);
          Navigator.pop(context);
        },
        leading: () {
          showButtonModalSheet(context);
        },
        textLeft: 'Hủy',
        textRight: 'Thêm',
        title: 'Lời nhắc mới',
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleNoteWidget(
                checkButtonBloc: checkButtonBloc,
                titleController: titleController,
                noteController: noteController,
              ),
              StreamBuilder<NewReminderState>(
                  initialData: newReminderBloc.newReminderState,
                  stream: newReminderBloc.listGroupController,
                  builder: (context, snapshot) {
                    return SelectContainer(
                      title: 'Chi tiết',
                      buttonDetails: snapshot.data.buttonDetails,
                      timeDetails: snapshot.data.timeDetails,
                      valuesTime: snapshot.data.valuesTime,
                      onTap: () {
                        Navigator.pushNamed(context, RouteList.details,
                            arguments: {
                              'date': snapshot.data.valuesTime,
                              'time': snapshot.data.timeDetails
                            }).then((value) {
                          newReminderBloc.setTime(value);
                        });
                      },
                    );
                  }),
              StreamBuilder<NewReminderState>(
                  initialData: newReminderBloc.newReminderState,
                  stream: newReminderBloc.listGroupController,
                  builder: (context, snapshot) {
                    return SelectContainer(
                      title: 'Danh sách',
                      buttonDetails: false,
                      group: snapshot.data.group,
                      color: ModelListReminder
                          .myList['${moDel[snapshot.data.index]}'].color,
                      onTap: () async {
                        Navigator.pushNamed(context, RouteList.listGroup,
                            arguments: {
                              'list': moDel,
                              'index': snapshot.data.index
                            }).then((value) {
                          newReminderBloc.setGroup(
                              ModelListReminder.myList['${moDel[value]}'].title,
                              value);
                        });
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
  void dispose() {
    // TODO: implement dispose
    checkButtonBloc.dispose();
    newReminderBloc.dispose();
    super.dispose();
  }
}
