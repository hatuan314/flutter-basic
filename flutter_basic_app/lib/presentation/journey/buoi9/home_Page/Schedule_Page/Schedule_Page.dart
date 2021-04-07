import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/home_Page/Schedule_Page/Page_View.dart';
import 'package:table_calendar/table_calendar.dart';

class schedulePage extends StatefulWidget {
  var data;
  schedulePage({Key key, this.data}) : super(key: key);
  @override
  _schedulePageState createState() => _schedulePageState();
}

class _schedulePageState extends State<schedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: DateTime.now(),
                locale: 'en_US',
              ),
              Expanded(
                  child: pageView(
                data: widget.data,
              )),
            ],
          ),
        ));
  }
}
