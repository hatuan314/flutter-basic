import 'package:flutter/material.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:provider/provider.dart';

import '../ProviderHomePage.dart';
import 'ScheduledWidget.dart';
import 'TodayWidget.dart';
class wrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:  context.watch<providerhomePage>().edit,
      maintainAnimation: true,
      maintainState: true,
      child: AnimatedOpacity(
        opacity: context.watch<providerhomePage>().edit?1:0,
        duration: Duration(milliseconds: 100),
        child: Wrap(
            spacing: 20,
            children: List.generate(3, (index) {
              return index == 2
                  ? todayWidget(constHomePage.list[index])
                  : scheduledWidgets(
                constHomePage.list[index],
              );
            })),
      ),
    );
  }
}
