import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/common/setting_argument/settting_argument.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_event.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_state.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/details_containst.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/widgets/time_widget.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/app_bar_reminder.dart';
import 'package:ghichu/presentation/journey/reminder/widgets/select_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsPage extends StatefulWidget {
  final SettingDetails settingDetails;
  const DetailsPage({Key key, this.settingDetails}) : super(key: key);
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsBloc, DetailsState>(listener: (context, state) {
      if (state is PushPrioritiesState) {
        Navigator.pushNamed(context, RouteList.prioritiesScreen,
                arguments: SettingPriority(indexSelect: state.indexSelect))
            .then((value) {
          SettingPriority settingPriority = value;
          BlocProvider.of<DetailsBloc>(context).add(UpDatePriorityEvent(
              indexSelect: settingPriority.indexSelect,
              priority: settingPriority.priority));
        });
      }
    }, builder: (context, state) {
      if (state is InitDetailsState) {
        return Scaffold(
          backgroundColor: Colors.white.withOpacity(0.95),
          appBar: AppBarReminderWidget(
            leading: () {
              TimeOfDay timeOfDay;
              DateTime dateTime;
              if (state.isDateSwitch == false) {
                dateTime = null;
                timeOfDay = null;
              } else {
                dateTime = state.selectDate;
                if (state.isTimeSwitch) {
                  timeOfDay = state.timeOfDay;
                } else {
                  timeOfDay = null;
                }
              }
              Navigator.pop(
                  context,
                  SettingDetails(
                      state: state,
                      timeOfDay: timeOfDay,
                      priorty: state.priority,
                      date: dateTime,
                      isTime: state.isTimeSwitch));
            },
            textLeft: DetailsContraints.leadingTxt,
            title: DetailsContraints.titleTxt,
            actions: widget.settingDetails.title.isEmpty
                ? null
                : () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
            textRight: Text(
              DetailsContraints.textRight,
              style: TextStyle(
                  color: widget.settingDetails.title.isEmpty
                      ? Colors.black26
                      : Colors.blue,
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
                    group: state.priority,
                    buttonDetails: false,
                    onTap: () {
                      BlocProvider.of<DetailsBloc>(context)
                          .add(PushPrioritiesEvent(index: state.indexSelect));
                    },
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
