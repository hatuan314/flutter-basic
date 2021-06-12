import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
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
    allListStream.update();
    int id;
    return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppbarWidgetForListScreen(context, () { Navigator.pushNamed(context, RouteList.createNewScreen).whenComplete(() async => await allListStream.update());}
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
                    child: StreamBuilder(
                        stream: allListStream.myListsStream,
                        builder: (context, snapshot) {
                          return ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.hasData ? snapshot.data.length : 1,
                              itemBuilder: (context, index) {
                                return Column(children: [
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(10),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        allListStream.MyLists[index].name,
                                        style: ThemeText.headline2ListScreen
                                            .copyWith(
                                                color: allListStream
                                                    .MyLists[index].color),
                                      ),
                                    ),
                                  ),
                                  allListStream.MyLists[index].list.length == 0
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
                                      : getReminderOfList(index)
                                ]);
                              });
                        }),
                  ))
                ]));
  }

  Widget getReminderOfList(int index)
  {
   return ListView.builder(
        shrinkWrap: true,
        itemCount: allListStream
            .MyLists[index].list.length,
        itemBuilder: (context, index1) {
          String time = (DateTime
              .fromMillisecondsSinceEpoch(
              allListStream
                  .MyLists[index]
                  .list[index1]
                  .dateAndTime)
              .hourHHmm);
          String date = DateTime
              .fromMillisecondsSinceEpoch(
              allListStream
                  .MyLists[index]
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
                        (_) =>
                        ConfirmDialog(      confirmText: 'Delete',
                            content: 'Are you sure you want to delete this reminder ?',
                            title:  'Delete ?',
                            onPressedCancel:
                                () {
                              Navigator.pop(
                                  context);
                            },
                            onPressedOk: ()=> _deleteReminder(index, index1)
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
                                .getPriorityColor(allListStream
                                .MyLists[
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
                                  width: ScreenUtil() .screenWidth -  75,
                                  child: Text(
                                      allListStream .MyLists[ index] .list[ index1] .title,
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
                                        75,
                                    child:
                                    Text(getDetails(index, index1, date, time),
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
                                      75,
                                )
                              ]),
                        )
                      ])));
        });
  }

  String getDetails(int index, int index1, String date, String time)
  {
    return allListStream.MyLists[index].list[index1].dateAndTime !=
        0
        ? ((allListStream.MyLists[index].list[index1].dateAndTime % 10 == 1)
        ? '${date == now ? 'Today' : date}, ${time} \n${allListStream.MyLists[index].list[index1].notes}'
        : '${date == now ? 'Today' : date}\n${allListStream.MyLists[index].list[index1].notes}')
        : '${allListStream.MyLists[index].list[index1].notes}';
  }
  void _deleteReminder(int index, int index1)
  {
      String  delDate;
      int id = allListStream
          .MyLists[index]
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
      allListStream
          .update();
      Navigator.pop(
          context);

  }
}
