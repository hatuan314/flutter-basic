import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/bottom_navigation_bar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/calendar_view.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/personal_event.dart';

class ScheduleScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:[
          CalendarView(),
          PersonalEvent(),
      ]
      ),
     //bottomNavigationBar: bnBar(context,0),
    );
  }

}