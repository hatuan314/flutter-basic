import 'package:flutter/material.dart';

import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_bloc.dart';
import 'package:ghichu/presentation/journey/home/home_page/bloc/home_page_state.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';

import 'package:ghichu/presentation/journey/home/home_page/widgets/sight_widget.dart';

class WrapWidget extends StatelessWidget {
  HomePageState state;
  WrapWidget({Key key, this.state}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: state.isEdit,
      maintainAnimation: true,
      maintainState: true,
      child: AnimatedOpacity(
          opacity: !state.isEdit ? 0 : 1,
          duration: HomePageConstants.durationContainer,
          child: Wrap(
              spacing: HomePageConstants.paddingWidth20,
              children: List.generate(state.reminderSystem.length, (index) {
                // return SightWidget(index: index);
                if (state.reminderSystem[index] ==
                    HomePageConstants.reminderTodayTxt) {
                  return SightWidget(
                      index: index,
                      reminderColor: HomePageConstants.reminderTodayColor,
                      reminderIcon: HomePageConstants.reminderTodayIcon,
                      reminderTxt: HomePageConstants.reminderTodayTxt,
                      reminderLeght: 0);
                }
                if (state.reminderSystem[index] ==
                    HomePageConstants.reminderScheduledTxt) {
                  return SightWidget(
                      index: index,
                      reminderColor: HomePageConstants.reminderScheduledColor,
                      reminderIcon: HomePageConstants.reminderScheduledIcon,
                      reminderTxt: HomePageConstants.reminderScheduledTxt,
                      reminderLeght: 0);
                }
                if (state.reminderSystem[index] ==
                    HomePageConstants.reminderAllTxt) {
                  return SightWidget(
                      index: index,
                      reminderColor: HomePageConstants.reminderAllColor,
                      reminderIcon: HomePageConstants.reminderAllIcon,
                      reminderTxt: HomePageConstants.reminderAllTxt,
                      reminderLeght: 0);
                }
                return SizedBox();
              }))),
    );
  }
}
