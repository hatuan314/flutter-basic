import 'package:intl/intl.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/new_reminder/provider_reminder.dart';

class DetailsWidget extends StatelessWidget {
  String title;
  String node;
  bool button;
  bool time;
  DetailsWidget({Key key, this.title, this.node, this.button})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.pushNamed(context, RouteList.details, arguments: [
          {'button': button}
        ]).then((value) {
          context.read<ProviderReminder>().setTime(value);
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
        height: ScreenUtil().setHeight(60),
        width: double.infinity,
        padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(20), right: ScreenUtil().setWidth(20)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(9))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Details',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: ScreenUtil().setSp(23)),
                ),
                context.watch<ProviderReminder>().buttonDetails
                    ? Row(
                        children: [
                          context.watch<ProviderReminder>().timeDetails
                              ? Text(
                                  '${DateFormat('HH:mm,').format(DateTime.fromMillisecondsSinceEpoch(context.watch<ProviderReminder>().valuesTime))}',
                                  style: TextStyle(
                                      color: Colors.black87.withOpacity(0.6),
                                      fontSize: ScreenUtil().setSp(14)))
                              : Text(''),
                          Text(
                              '${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(context.watch<ProviderReminder>().valuesTime))}',
                              style: TextStyle(
                                  color: Colors.black87.withOpacity(0.6),
                                  fontSize: ScreenUtil().setSp(14)))
                          //   Text(context.watch<ProviderReminder>().valuesTime==null?'':'ngày ${context.watch<ProviderReminder>().valuesTime[0]['date'].day} thg ${context.watch<ProviderReminder>().valuesTime[0]['date'].month}, ${context.watch<ProviderReminder>().valuesTime[0]['date'].year}',style: TextStyle(color: Colors.black87.withOpacity(0.6),fontSize: ScreenUtil().setSp(14)))
                        ],
                      )
                    : SizedBox(),
              ],
            ),
            Icon(
              Icons.navigate_next_outlined,
              size: ScreenUtil().setSp(30),
              color: Colors.black45,
            )
          ],
        ),
      ),
    );
  }
}
