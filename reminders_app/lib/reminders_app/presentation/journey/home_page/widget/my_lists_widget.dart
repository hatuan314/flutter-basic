import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/bloc/home_state.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/bloc/homepage_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/list/list_screen.dart';
import 'package:reminders_app/reminders_app/presentation/theme/theme.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/confirm_dialog.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/icon_slide_widget.dart';

import '../../reminders_list.dart';
import '../homepage_constants.dart';

class MyListsWidget extends StatelessWidget{
  HomeState homeState;
HomeStream homeStream;
  MyListsWidget({@required this.homeState,@required this.homeStream});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount:
        homeState.MyLists.length == null ? 1 : homeState.MyLists.length,
        itemBuilder: (context, index) {
          return Slidable(
            closeOnScroll: true,
            actionPane: SlidableDrawerActionPane(),
            secondaryActions: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
                child: IconSlideWidget.edit(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
                child: IconSlideWidget.delete(() => {
                  RemindersList.MyLists[index].name == 'Reminders'
                      ? showDialog(
                      context: context,
                      builder: (_) => AlertDialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(15)),
                          title: Text(
                            'Default list cannot be deleted',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(15)),
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'OK',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(17),
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ]))
                      : showDialog(
                      context: context,
                      builder: (_) => ConfirmDialog(
                        onPressedCancel: () {
                          Navigator.pop(context);
                        },
                        content:
                        'This will delete all reminders in this list',
                        title: 'Delete?',
                        onPressedOk: ()=>deleteList(context, index),
                      )),
                }),
              )
            ],
            actionExtentRatio: 0.2,
            child: GestureDetector(
              onTap: () async {
                await Navigator.push(context,
                    MaterialPageRoute(builder: (_) => (ListScreen(index))))
                    .whenComplete(() => homeStream.update());
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: ScreenUtil().setWidth(10)),
                padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: HomePageConstant.listIconWidget(homeState.MyLists[index].color),
                      ),
                    ),
                    Expanded(
                      flex: 22,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          homeState.MyLists[index].name,
                          style: ThemeText.title2,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Text(
                          '${homeState.MyLists[index].list.length}',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              color: Colors.grey,
                              fontWeight: FontWeight.w600),
                        )),
                    Expanded(flex: 1, child: HomePageConstant.iconArrow),
                  ],
                ),
              ),
            ),
          );
        });
  }

  deleteList(BuildContext context, int index) {
    for (int j = 0;
    j <
        RemindersList
            .MyLists[index].list.length;
    j++) {
      RemindersList.allReminders
          .forEach((key, value) {
        for (int i = 0; i < value.length; i++) {
          if (value[i].id ==
              RemindersList
                  .MyLists[index].list[i].id) {
            value.removeAt(i);
            i--;
          }
        }
      });
    }
    ;
    RemindersList.MyLists.removeAt(index);
    index--;
    homeStream.update();
    Navigator.pop(context);
  }

}