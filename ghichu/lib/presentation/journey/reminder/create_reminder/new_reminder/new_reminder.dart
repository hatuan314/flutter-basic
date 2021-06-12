import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghichu/common/constants/layout_constants.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/common/constants/string_constants.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_event.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/new_reminder_constants.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/widgets/time_widget.dart';
import 'package:ghichu/presentation/journey/reminder/reminder_constants.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/select_container.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/text_filed_title_note.dart';
import 'package:ghichu/presentation/journey/widgets/app_bar.dart';
import 'package:ghichu/presentation/journey/widgets/show_model_button_sheet.dart';
import 'package:ghichu/presentation/models/group.dart';

class NewReminderPage extends StatefulWidget {
  final List<Groups> listGroup;
  final String title;
  final String note;
  final int date, index;
  final bool isTime;
  final bool isEdit;

  const NewReminderPage({
    Key key,
    this.listGroup,
    this.title,
    this.note,
    this.date,
    this.index,
    this.isTime,
    this.isEdit,
  }) : super(key: key);

  @override
  _NewReminderPageState createState() => _NewReminderPageState();
}

class _NewReminderPageState extends State<NewReminderPage> {
  TextEditingController titleController = new TextEditingController();
  TextEditingController noteController = new TextEditingController();
  CheckButtonBloc checkButtonBloc = CheckButtonBloc();
  DetailsBloc detailsBloc;

  @override
  void initState() {
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
    return BlocBuilder<NewReminderBloc, NewReminderState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        appBar: AppBarWidget(
          actions: () {
            if (widget.isEdit == false) {
              // newReminderBloc.newReminderState.addTodoList(
              //     titleController.text,
              //     noteController.text,
              //     newReminderBloc.newReminderState.valuesTime,
              //     widget.listGroup[newReminderBloc.newReminderState.index],
              //     'none',
              //     DateTime.now().millisecondsSinceEpoch,
              //     DateTime.now().millisecondsSinceEpoch,
              //     newReminderBloc.newReminderState.isTimeDetails);
            }
            Navigator.pop(context);
          },
          leading: () {
            showButtonModalSheet(context);
          },
          color: state.activeBtn ? Colors.blue : Colors.black38,
          textLeft: NewReminderContants.textLeading,
          textRight: widget.isEdit
              ? NewReminderContants.textRightEdit
              : NewReminderContants.textRight,
          title: widget.isEdit
              ? NewReminderContants.textTitleEdit
              : NewReminderContants.textTitle,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: LayoutConstants.paddingHorizontalApp,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleNoteWidget(
                  onChange: (value) {
                    BlocProvider.of<NewReminderBloc>(context)
                        .add(ActiveBtn(title: value));
                  },
                  titleController: titleController,
                  noteController: noteController,
                ),
                widget.isEdit
                    ? Padding(
                        padding:
                            EdgeInsets.only(top: ReminderContants.marginTop),
                        child: TimeWidget(
                          detailsBloc: detailsBloc,
                        ),
                      )
                    : SelectContainer(
                        title: ReminderContants.detailsTxt,
                        buttonDetails: false,
                        // buttonDetails: snapshot.data.isButtonDetails,
                        // timeDetails: snapshot.data.isTimeDetails,
                        // valuesTime: snapshot.data.valuesTime,
                        onTap: () {
                          // Navigator.pushNamed(context, RouteList.details,
                          //     arguments: {
                          //       // StringConstants.reminderDate:
                          //       //     snapshot.data.valuesTime,
                          //       // StringConstants.isTimeArg:
                          //       //     snapshot.data.isTimeDetails,
                          //       StringConstants.keyGroup: widget.listGroup[
                          //           newReminderBloc.newReminderState.index],
                          //       StringConstants.titleReminder:
                          //           titleController.text,
                          //       StringConstants.noteReminder: noteController.text,
                          //     }).then((value) {
                          //   newReminderBloc.setTime(value);
                          // });
                        },
                      ),
                SelectContainer(
                  title: ReminderContants.listTxt,
                  buttonDetails: false,
                  // group: snapshot.data.group,
                  color: widget.listGroup[0].color,
                  onTap: () async {
                    Navigator.pushNamed(context, RouteList.listGroup,
                        arguments: {
                          StringConstants.listGroup: widget.listGroup,
                          // StringConstants.listIndexArg: snapshot.data.index
                        }).then((index) {
                      // newReminderBloc.setGroup(
                      //     ModelListReminder
                      //         .myList['${widget.listGroup[index]}'].title,
                      //     index);
                    });
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  void setData() {
    // checkButtonBloc.setButtom(widget.title);
    // newReminderBloc.setGroup(
    //     ModelListReminder.myList['${widget.listGroup[widget.index]}'].title,
    //     widget.index);
    // titleController.text = widget.title;
    // noteController.text = widget.note;
    // detailsBloc.setTimeSwitch(widget.isTime);
    // if (widget.isTime == true) {
    //   detailsBloc.detailsState.timeHour(
    //       DateTime.fromMillisecondsSinceEpoch(widget.date).hour,
    //       DateTime.fromMillisecondsSinceEpoch(widget.date).minute);
    // }
    // if (widget.date != null) {
    //   detailsBloc.detailsState.dateTime =
    //       DateTime.fromMillisecondsSinceEpoch(widget.date);
    //   detailsBloc.detailsState
    //       .dateScheldul(DateTime.fromMillisecondsSinceEpoch(widget.date));
    //   detailsBloc.setDateSwitch(true);
    // } else {
    //   detailsBloc.setDateSwitch(false);
    // }
  }

  @override
  void dispose() {
    checkButtonBloc.dispose();

    if (widget.isEdit) {
      detailsBloc.dispose();
    }
    super.dispose();
  }
}
