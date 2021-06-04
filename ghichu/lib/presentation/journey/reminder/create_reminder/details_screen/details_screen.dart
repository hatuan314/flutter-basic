import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/details_containst.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/bloc/new_reminder_state.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/widgets/time_widget.dart';
import 'package:ghichu/common/extension/extensin_datetime.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/app_bar_reminder.dart';

class DetailsPage extends StatefulWidget {
  final bool isTime;
  final int date;
  final String title, note, group;
  const DetailsPage(
      {Key key, this.isTime, this.date, this.group, this.title, this.note})
      : super(key: key);
  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<DetailsPage> {
  DetailsBloc detailsBloc = DetailsBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBarReminderWidget(
        leading: () {
          detailsBloc.detailsState.removePage(context);
        },
        textLeft: DetailsContraints.leadingTxt,
        title: DetailsContraints.titleTxt,
        actions: widget.title.isEmpty
            ? null
            : () {
                NewReminderState().addTodoList(
                    widget.title,
                    widget.note,
                    detailsBloc.detailsState.dateTime.getTime(
                        detailsBloc.detailsState.date,
                        detailsBloc.detailsState.time,
                        detailsBloc.detailsState.hour,
                        detailsBloc.detailsState.minuner),
                    widget.group,
                    'none',
                    DateTime.now().millisecondsSinceEpoch,
                    DateTime.now().millisecondsSinceEpoch,
                    detailsBloc.detailsState.time);
                Navigator.pop(context);
                Navigator.pop(context);
              },
        textRight: Text(
          DetailsContraints.textRight,
          style: TextStyle(
              color: widget.title.isEmpty ? Colors.black26 : Colors.blue,
              fontWeight: FontWeight.w600,
              fontSize: ScreenUtil().setSp(18)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15)),
          child: Column(
            children: [
              TimeWidget(
                detailsBloc: detailsBloc,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
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
    detailsBloc.dispose();
    super.dispose();
  }
}
