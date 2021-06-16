import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/all_reminders/bloc/all_list_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/all_reminders/bloc/all_list_event.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/all_reminders/bloc/all_list_state.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminder/reminders_constants.dart';
import 'package:reminders_app/reminders_app/presentation/theme/theme.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/appbar_for_list_screen.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/confirm_dialog.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/icon_slide_widget.dart';
import 'bloc/all_list_stream.dart';
import '../../reminders_list.dart';

import 'package:reminders_app/reminders_app/common/extensions/date_extensions.dart';

class AllRemindersList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AllRemindersList();
}

class _AllRemindersList extends State<AllRemindersList> {
  String now = DateTime.now().dateDdMMyyyy;
  AllListStream allListStream = AllListStream();

  @override
  void dispose() {
    allListStream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  //  allListStream.update();
    int id;
    return BlocBuilder<AllReminderBloc,AllReminderState>(
      builder: (context,state){
     return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppbarWidgetForListScreen(context, () { Navigator.pushNamed(context, RouteList.createNewScreen).whenComplete(() async => await  BlocProvider.of<AllReminderBloc>(context)
                  .add(UpdateEvent(myLists: RemindersList.MyLists)),);}
                ,),
              body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: ScreenUtil().setHeight(10),
                          left: ScreenUtil().setWidth(20)),
                      child: Text(RemindersConstants.allTxt,
                          style: ThemeText.headlineListScreen.copyWith(color: Colors.black)),
                    ),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(
                        bottom: ScreenUtil().setHeight(12),
                        right: ScreenUtil().setWidth(12),
                        left: ScreenUtil().setWidth(20),
                      ),
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.myLists.length,
                          itemBuilder: (context, index) {
                            return Column(children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: ScreenUtil().setHeight(10),
                                ),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    state.myLists[index].name,
                                    style: ThemeText.headline2ListScreen
                                        .copyWith(
                                        color: state.myLists[index].color),
                                  ),
                                ),
                              ),
                              state.myLists[index].list.length == 0
                                  ? Padding(
                                padding: EdgeInsets.only(
                                    top: ScreenUtil().setHeight(20),
                                    bottom:
                                    ScreenUtil().setHeight(20)),
                                child: Align(
                                    alignment: Alignment.center,
                                    child: RemindersConstants
                                        .noReminders),
                              )
                                  : getReminderOfList(index,state)
                            ]);
                          }),
                    ))
                  ])
    );}
    );
  }

  Widget getReminderOfList(int index,AllReminderState state)
  {
   return ListView.builder(
        shrinkWrap: true,
        itemCount: state.myLists[index].list.length,
        itemBuilder: (context, index1) {
          String time = (DateTime
              .fromMillisecondsSinceEpoch(
              state.myLists[index]
                  .list[index1]
                  .dateAndTime)
              .hourHHmm);
          String date = DateTime
              .fromMillisecondsSinceEpoch(
              state.myLists[index]
                  .list[index1]
                  .dateAndTime)
              .dateDdMMyyyy;
          return Slidable(
              closeOnScroll: true,
              actionPane:
              SlidableDrawerActionPane(),
              secondaryActions: [
                IconSlideWidget.edit(),
                IconSlideWidget.delete(() => {
                  showDialog( context: context,
                    builder:
                        (dialogContext) =>
                        ConfirmDialog(      confirmText: 'Delete',
                            content: 'Are you sure you want to delete this reminder ?',
                            title:  'Delete ?',
                            onPressedCancel:
                                () {
                              Navigator.pop(
                                  context);
                            },
                            onPressedOk: ()=> _deleteReminder(index, index1,state)
                        ),  ) },)
              ],
              actionExtentRatio: 0.2,
              child: Container(
                  padding: EdgeInsets.only(
                      top: ScreenUtil()
                          .setHeight(10)),
                  child: Row(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Container(
                          width:15.h,
                          height:15.h,
                          decoration:
                          BoxDecoration(
                            shape: BoxShape  .circle,
                            color: RemindersConstants
                                .getPriorityColor(state.myLists[
                            index]
                                .list[
                            index1]
                                .priority),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil()
                                  .setWidth(
                                  20)),
                          child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .start,
                              children: [
                                Container(
                                  width: ScreenUtil() .screenWidth -  85,
                                  child: Text(
                                      state.myLists[ index] .list[ index1] .title,
                                      overflow:
                                      TextOverflow
                                          .ellipsis,
                                      maxLines:
                                      5,
                                      softWrap:
                                      false,
                                      style:ThemeText.title
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      top: ScreenUtil()
                                          .setHeight(3)),
                                  child:
                                  Container(
                                    width:
                                    ScreenUtil().screenWidth -
                                        85,
                                    child:
                                    Text(getDetails(index, index1, date, time,state),
                                      overflow:  TextOverflow.ellipsis,
                                      maxLines:  5,
                                      softWrap:  false,
                                      style: ThemeText.subtitle,
                                    ),
                                  ),),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil()
                                          .setHeight(10)),
                                  color: Colors
                                      .grey,
                                  height: ScreenUtil()
                                      .setHeight(
                                      0.5),
                                  width: ScreenUtil()
                                      .screenWidth -
                                      85,
                                )
                              ]),
                        )
                      ])));
        });
  }

  String getDetails(int index, int index1, String date, String time, AllReminderState state)
  {
    return state.myLists[index].list[index1].dateAndTime !=
        0
        ? ((state.myLists[index].list[index1].dateAndTime % 10 == 1)
        ? '${date == now ? 'Today' : date}, ${time} \n${state.myLists[index].list[index1].notes}'
        : '${date == now ? 'Today' : date}\n${state.myLists[index].list[index1].notes}')
        : '${state.myLists[index].list[index1].notes}';
  }
  void _deleteReminder(int index, int index1,AllReminderState state)
  {
      String  delDate;
      int id = state.myLists[index]
          .list[index1]
          .id;
      RemindersList
          .MyLists[index]
          .list
          .removeAt(index1);

      RemindersList
          .allReminders
          .forEach((key, value) {
        for (int i = 0;
        i < value.length;
        i++) {
          if (value[i].id == id) {
            value.removeAt(i);
            i--;
          }
          if (RemindersList.allReminders[key].length == 0) {
            delDate = key;
          }
        }
      });
      RemindersList
          .allReminders
          .remove(delDate);
      index1--;
      BlocProvider.of<AllReminderBloc>(context).add(UpdateEvent(myLists: RemindersList.MyLists));
      Navigator.pop(
          context);

  }
}
