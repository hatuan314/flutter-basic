import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/bloc/homepage_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/all_reminders/all_list_screen.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/all_reminders/bloc/all_list_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/bloc/new_reminder_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/create_new_reminder/create_new_reminder.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/new_reminder/details/details_screen.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/scheduled_list/scheduled_list_screen.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/today_list/todaylist_screen.dart';
import 'home_page/home_screen.dart';
import 'list/new_list/bloc/add_list_bloc.dart';
import 'list/new_list/create_new_list.dart';
import 'reminder/new_reminder/details/bloc/add_details_bloc.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> getAll() {
    return {
      RouteList.allListScreen: (_) => BlocProvider<AllReminderBloc>(
    create: (context) => AllReminderBloc(),
    child: AllRemindersList(),),

      RouteList.todayListScreen: (_) => TodayList(),

      RouteList.homeScreen: (_) => BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(),
            child: HomeScreen(),
          ),

      RouteList.scheduledListScreen: (_) => ScheduledList(),

      RouteList.createNewScreen: (_) => BlocProvider<NewReminderBloc>(
    create: (context) => NewReminderBloc(), child: CreateNewReminder()),

      RouteList.detailsScreen: (_) => BlocProvider<AddDetailsBloc>(
          create: (context) => AddDetailsBloc(), child: DetailsScreen()),

      RouteList.createNewList: (_) => BlocProvider<AddListBloc>(
          create: (context) => AddListBloc(), child: NewList()),
      //  ),
    };
  }
}
