import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:reminders_app/reminders_app/common/enums/priority_type.dart';
import 'package:reminders_app/reminders_app/common/utils/priority_type_utils.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/bloc/details_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/details_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/widget/priority_item.dart';

class PriorityDialog extends StatelessWidget{
  DetailsStream detailsStream;
  String selectedPriority;

  PriorityDialog({@required this.detailsStream, @required this.selectedPriority});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog (
      titlePadding: EdgeInsets.only(
        top: ScreenUtil().setHeight(15),
        left: ScreenUtil().setWidth(15),
      ),
      contentPadding: EdgeInsets.symmetric(
        vertical: 0,
      ),
      title: Text(
        DetailConstants.priorityTxt,
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
      children: [
        PriorityItemWidget(
          name: priorityTypeUtil(PriorityType.NONE),
          color: Colors.grey,
          onTap: () => {
            detailsStream.setPriority(0),
            Navigator.pop(context),
            selectedPriority = priorityTypeUtil(PriorityType.NONE),
            log(selectedPriority)
          },
          isNotLast: true,
        ),
        PriorityItemWidget(
            name: priorityTypeUtil(PriorityType.LOW),
            color: Colors.yellow,
            onTap: () => {
              detailsStream.setPriority(1),
              Navigator.pop(context),
              selectedPriority = priorityTypeUtil(PriorityType.LOW),
              log(selectedPriority)
            },
            isNotLast: true),
        PriorityItemWidget(
            name: priorityTypeUtil(PriorityType.MEDIUM),
            color: Colors.orange,
            onTap: () => {
              detailsStream.setPriority(2),
              Navigator.pop(context),
              selectedPriority = priorityTypeUtil(PriorityType.MEDIUM),
              log(selectedPriority)
            },
            isNotLast: true),
        PriorityItemWidget(
            name: priorityTypeUtil(PriorityType.HIGH),
            color: Colors.red,
            onTap: () => {
              detailsStream.setPriority(3),
              Navigator.pop(context),
              selectedPriority = priorityTypeUtil(PriorityType.HIGH),
              log(selectedPriority)
            },
            isNotLast: false),
      ],
    );
  }

}