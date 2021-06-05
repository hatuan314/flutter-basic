import 'package:flutter/cupertino.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/common/constants/string_constants.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/all_reminder_screen.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/details_screen/details_screen.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/list_group.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/new_reminder/new_reminder.dart';

import 'package:ghichu/presentation/journey/reminder/schedule_reminder/schedule_reminder_screen.dart';
import 'package:ghichu/presentation/journey/reminder/today_reminder/today_reminder_screen.dart';

class RouteReminder {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.allPage: (context) => AllPage(),
      RouteList.scheduled: (context) => SchedulePage(),
    };
  }

  static Map<String, WidgetBuilder> getRoutesWithSettings() {
    return {
      RouteList.todayPage: (context) {
        final args=ModalRoute.of(context).settings.arguments as Map<String,dynamic>;
        var keyGroup=args[StringConstants.keyGroup];
        return TodayPage(keyGroup: keyGroup,);
      },
      RouteList.details: (context) {
        final args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        var isTime = args[StringConstants.isTimeArg] ?? false;
        var date = args[StringConstants.reminderDate];
        var title = args[StringConstants.titleReminder];
        var note = args[StringConstants.noteReminder];
        var group = args[StringConstants.keyGroup];
        return DetailsPage(
          isTime: isTime,
          date: date,
          title: title,
          note: note,
          group: group,

        );
      },
      RouteList.newReminder: (context) {
        final args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        var list = args[StringConstants.listGroup];
        var title = args[StringConstants.titleReminder];
        var note = args[StringConstants.noteReminder];
        var isEdit = args[StringConstants.isEdit];
        var date = args[StringConstants.date];
        var isTimeArg = args[StringConstants.isTimeArg];
        var index=args[StringConstants.listIndexArg];
        return NewReminderPage(
          listGroup: list,
          title: title,
          note: note,
          isEdit: isEdit,
          date: date,
          isTime: isTimeArg,
          index: index,
        );
      },
      RouteList.listGroup: (context) {
        final args =
            ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
        var index = args[StringConstants.listIndexArg] ?? 0;
        var list = args[StringConstants.listGroup];
        return ListGroupScreen(
          index: index,
          list: list,
        );
      }
    };
  }
}
