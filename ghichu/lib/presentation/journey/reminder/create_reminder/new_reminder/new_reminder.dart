import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/common/constants/string_constants.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_bloc.dart';

import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/new_reminder_constants.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/widgets/time_widget.dart';
import 'package:ghichu/presentation/journey/reminder/reminder_constants.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/select_container.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/text_filed_title_note.dart';
import 'package:ghichu/presentation/journey/widgets/app_bar.dart';
import 'package:ghichu/presentation/journey/widgets/show_model_button_sheet.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class NewReminderPage extends StatefulWidget {
  List<String> listGroup;
  String title;
  String note;
  int date, index;
  bool isTime;
  bool isEdit;
  NewReminderPage(
      {this.listGroup,
      this.title,
      this.note,
      this.isEdit,
      this.date,
      this.isTime,
      this.index});

  @override
  _newReminderPageState createState() => _newReminderPageState();
}

class _newReminderPageState extends State<NewReminderPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  CheckButtonBloc checkButtonBloc = CheckButtonBloc();
  NewReminderBloc newReminderBloc = NewReminderBloc();
  DetailsBloc detailsBloc;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.isEdit) {
      detailsBloc = DetailsBloc();
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (widget.isEdit) {
      setData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    newReminderBloc.newReminderState.group =
        ModelListReminder.myList['${widget.listGroup[0]}'].title;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBarWidget(
        blocCheckButton: checkButtonBloc,
        actions: () {
          if (widget.isEdit == false) {
            newReminderBloc.newReminderState.addTodoList(
                titleController.text,
                noteController.text,
                newReminderBloc.newReminderState.valuesTime,
                widget.listGroup[newReminderBloc.newReminderState.index],
                'none',
                DateTime.now().millisecondsSinceEpoch,
                DateTime.now().millisecondsSinceEpoch,
                newReminderBloc.newReminderState.isTimeDetails);
          }
          Navigator.pop(context);
        },
        leading: () {
          showButtonModalSheet(context);
        },
        textLeft: NewReminderContants.textLeading,
        textRight:widget.isEdit? NewReminderContants.textRightEdit:NewReminderContants.textRight,
        title: widget.isEdit?NewReminderContants.textTitleEdit:NewReminderContants.textTitle,
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
              widget.isEdit
                  ? Padding(
                      padding: EdgeInsets.only(top: ReminderContants.marginTop),
                      child: TimeWidget(
                        detailsBloc: detailsBloc,
                      ),
                    )
                  : StreamBuilder<NewReminderState>(
                      initialData: newReminderBloc.newReminderState,
                      stream: newReminderBloc.listGroupController,
                      builder: (context, snapshot) {
                        return SelectContainer(
                          title: ReminderContants.detailsTxt,
                          buttonDetails: snapshot.data.isButtonDetails,
                          timeDetails: snapshot.data.isTimeDetails,
                          valuesTime: snapshot.data.valuesTime,
                          onTap: () {
                            Navigator.pushNamed(context, RouteList.details,
                                arguments: {
                                  StringConstants.reminderDate:
                                      snapshot.data.valuesTime,
                                  StringConstants.isTimeArg:
                                      snapshot.data.isTimeDetails,
                                  StringConstants.keyGroup: widget.listGroup[
                                      newReminderBloc.newReminderState.index],
                                  StringConstants.titleReminder:
                                      titleController.text,
                                  StringConstants.noteReminder:
                                      noteController.text,
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
                      title: ReminderContants.listTxt,
                      buttonDetails: false,
                      group: snapshot.data.group,
                      color: ModelListReminder
                          .myList['${widget.listGroup[snapshot.data.index]}']
                          .color,
                      onTap: () async {
                        Navigator.pushNamed(context, RouteList.listGroup,
                            arguments: {
                              StringConstants.listGroup: widget.listGroup,
                              StringConstants.listIndexArg: snapshot.data.index
                            }).then((index) {
                          newReminderBloc.setGroup(
                              ModelListReminder
                                  .myList['${widget.listGroup[index]}'].title,
                              index);
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
void setData(){
  checkButtonBloc.setButtom(widget.title);
  newReminderBloc.setGroup(
      ModelListReminder.myList['${widget.listGroup[widget.index]}'].title,
      widget.index);
  titleController.text = widget.title;
  noteController.text = widget.note;
  detailsBloc.setTimeSwitch(widget.isTime);
  if (widget.isTime == true) {
    detailsBloc.detailsState.timeHour(
        DateTime.fromMillisecondsSinceEpoch(widget.date).hour,
        DateTime.fromMillisecondsSinceEpoch(widget.date).minute);
  }
  if (widget.date != null) {
    detailsBloc.detailsState.dateTime =
        DateTime.fromMillisecondsSinceEpoch(widget.date);
    detailsBloc.detailsState
        .dateScheldul(DateTime.fromMillisecondsSinceEpoch(widget.date));
    detailsBloc.setDateSwitch(true);
  } else {
    detailsBloc.setDateSwitch(false);
  }
}
  @override
  void dispose() {
    // TODO: implement dispose
    checkButtonBloc.dispose();
    newReminderBloc.dispose();
    if (widget.isEdit) {
      detailsBloc.dispose();
    }
    super.dispose();
  }
}
