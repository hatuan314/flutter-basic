import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/details_containst.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/widgets/time_widget.dart';

import 'package:ghichu/presentation/journey/reminder/widgets/app_bar_reminder.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/select_container.dart';
import 'package:ghichu/presentation/models/group.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  final bool isTime;
  final int date;
  final String title, note;
  final Groups group;

  const DetailsPage(
      {Key key, this.isTime, this.date, this.group, this.title, this.note})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is InitDetailsState) {
            return Scaffold(
              backgroundColor: Colors.white.withOpacity(0.95),
              appBar: AppBarReminderWidget(
                leading: () {
                  // detailsBloc.detailsState.removePage(context);
                  Navigator.pop(context);
                },
                textLeft: DetailsContraints.leadingTxt,
                title: DetailsContraints.titleTxt,
                actions: widget.title.isEmpty
                    ? null
                    : () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                textRight: Text(
                  DetailsContraints.textRight,
                  style: TextStyle(
                      color:
                          widget.title.isEmpty ? Colors.black26 : Colors.blue,
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
                        state: state,
                      ),
                      SelectContainer(
                        title: 'Mức ưu tiên',
                        group: 'Không có',
                        buttonDetails: false,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Material(
            color: Colors.white,
          );
        });
  }

  @override
  void initState() {
    super.initState();
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
    super.dispose();
  }
}
