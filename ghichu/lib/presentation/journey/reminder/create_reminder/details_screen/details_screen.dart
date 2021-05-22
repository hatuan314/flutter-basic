import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/bloc/details_bloc.dart';

import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/widgets/time_widget.dart';

class DetailsPage extends StatefulWidget {
  final bool isTime;
  final int date;

  const DetailsPage({Key key, this.isTime, this.date}) : super(key: key);
  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<DetailsPage> {
  bool date = false;
  DetailsBloc detailsBloc = DetailsBloc();
  var moDel;

  @override
  Widget build(BuildContext context) {
    // context.read<ProviderDetailsPage>().setdateTime(moDel[1], moDel[2]);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: ScreenUtil().setWidth(150),
        leading: GestureDetector(
          onTap: () {
            detailsBloc.detailsState.removePage(context);
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.blue,
              ),
              Text(
                'New Reminder',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
              )
            ],
          ),
        ),
        title: Text(
          'Details',
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(18)),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Add',
                style: TextStyle(
                    color: Colors.black26,
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
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
    });
  }

  @override
  void dispose() {
    detailsBloc.dispose();
    super.dispose();
  }
}
