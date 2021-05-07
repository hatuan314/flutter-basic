import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';

import '../reminder_provider.dart';
import '../reminders_list.dart';
import 'details_provider.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<DetailsProvider>(context, listen: false);
    final SimpleDialog priorityDialog = SimpleDialog(
      contentPadding: EdgeInsets.only(
        bottom: ScreenUtil().setHeight(10),
        top: ScreenUtil().setHeight(10),
        left: ScreenUtil().setWidth(20),
        right: ScreenUtil().setWidth(20),
      ),
      title: Text(
        'Priority',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(15),
            fontWeight: FontWeight.w700,
            color: Colors.black),
      ),
      children: [
        GestureDetector(
          onTap: () => {item.setPriority('None'),
          Navigator.pop(context)},
          child: Container(
            margin: EdgeInsets.all(ScreenUtil().setHeight(10)),
            child: Text(
              'None',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(15),
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          ),
        ),
        GestureDetector(
          onTap: ()=>{ item.setPriority('Low'),
    Navigator.pop(context)},
          child: Container(
              margin: EdgeInsets.all(ScreenUtil().setHeight(10)),
              child: Row(children: [
                Expanded(
                  flex: 20,
                  child: Text(
                    'Low',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: ScreenUtil().setHeight(10),
                    width: ScreenUtil().setHeight(10),
                    color: Colors.yellow,
                  ),
                )
              ])),
        ),
        GestureDetector(
          onTap: ()=> {item.setPriority('Medium'),
            Navigator.pop(context)},
          child: Container(
              margin: EdgeInsets.all(ScreenUtil().setHeight(10)),
              child: Row(children: [
                Expanded(
                  flex: 20,
                  child: Text(
                    'Medium',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: ScreenUtil().setHeight(10),
                    width: ScreenUtil().setHeight(10),
                    color: Colors.orange,
                  ),
                )
              ])),
        ),
        GestureDetector(
          onTap: ()=>{ item.setPriority('High'),
            Navigator.pop(context)},
          child: Container(
              margin: EdgeInsets.all(ScreenUtil().setHeight(10)),
              child: Row(children: [
                Expanded(
                  flex: 20,
                  child: Text(
                    'High',
                    style: TextStyle(
                        fontSize: ScreenUtil().setSp(15),
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: ScreenUtil().setHeight(10),
                    width: ScreenUtil().setHeight(10),
                    color: Colors.red,
                  ),
                )
              ])),
        )
      ],
    );

    return SafeArea(
      child: Scaffold(
          //  backgroundColor: Colors.transparent,
          appBar: _appBar(context),
          body: Column(children: [
            Padding(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
                right: ScreenUtil().setWidth(20),
              ),
              child: Container(
                //   padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GridView(
                    /*  padding: EdgeInsets.only(
                            top: ScreenUtil().setHeight(20),
                            left: ScreenUtil().setWidth(10),
                            right: ScreenUtil().setWidth(10),
                          ),*/
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      //   crossAxisSpacing: ScreenUtil().setWidth(10),
                      childAspectRatio: 6,
                    ),
                    children: [
                      ListTile(
                        title: Text(
                          'Date',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(17),
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          item.hasDate == true ? item.date : '',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                        ),
                        leading: Container(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(4)),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.calendar_today_sharp,
                            size: ScreenUtil().setSp(22),
                            color: Colors.white,
                          ),
                        ),
                        trailing: CupertinoSwitch(
                          value: item.hasDate,
                          onChanged: (bool value) {
                            selectDate(context, value);
                          },
                        ),
                      ),
                      /*   Align(
                          alignment: Alignment.centerRight,
                            child: Container(
                              width: ScreenUtil().screenWidth*2/3,
                              height: ScreenUtil().setHeight(1),
                              color: Colors.grey,
                            ),
                          ),*/
                      ListTile(
                        title: Text(
                          'Time',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(17),
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                        subtitle: Text(
                          item.hasTime == true ? item.time : '',
                          style: TextStyle(
                              fontSize: ScreenUtil().setSp(12),
                              fontWeight: FontWeight.w400,
                              color: Colors.blue),
                        ),
                        leading: Container(
                          padding: EdgeInsets.all(ScreenUtil().setHeight(4)),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.timer,
                            size: ScreenUtil().setSp(22),
                            color: Colors.white,
                          ),
                        ),
                        trailing: CupertinoSwitch(
                          value: item.hasDate==true?item.hasTime:false,
                          onChanged: (bool value) {
                            if(item.hasDate==true)
                            selectTime(context, value);
                          },
                        ),
                      ),
                    ]),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(
                  ScreenUtil().setWidth(20),
                ),
                child: Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: GestureDetector(
                    onTap: () async => await {
                      showDialog(
                          context: context,
                          builder: (context) => priorityDialog)
                    },
                    child: Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: Text(
                              'Priority',
                              style: TextStyle(
                                  fontSize: ScreenUtil().setSp(15),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Expanded(
                            flex: 2,

                              child: Text(item.priority,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                    fontSize: ScreenUtil().setSp(12.5),
                                    color: Colors.grey,
                                  )),

                          ),
                          Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: ScreenUtil().setSp(15),
                                color: Colors.grey,
                              )),
                        ],
                      ),
                    ),
                  ),
                )),
          ])),
    );
  }

  void selectTime(BuildContext context, bool hasTime) async {
    // final item = Provider.of<TodoItem>(context,listen: true);
    if (hasTime) {
      final TimeOfDay newTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );
      if (newTime != null) {
        context.read<DetailsProvider>().setTime(newTime, hasTime);
        //   time=newTime;
        // log(item.time.toString());
      }
    } else {
      context.read<DetailsProvider>().setTime(TimeOfDay.now(), hasTime);
    }
  }

  void selectDate(BuildContext context, bool hasDate) async {
    if (hasDate) {
      final DateTime picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2015, 8),
          lastDate: DateTime(2101));
      if (picked != null) {
        context.read<DetailsProvider>().setDate(picked, hasDate);
        // selectedDay=picked;
        //log(selectedDay.day);
      }
    } else {
      context.read<DetailsProvider>().setDate(DateTime.now(), hasDate);
    }
  }

  Widget _appBar(BuildContext context) {
    final item = Provider.of<DetailsProvider>(context);
    int value;
    return AppBar(
      elevation: 0,
      leadingWidth: ScreenUtil().screenWidth / 4,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Icon(Icons.arrow_back_ios_rounded,
                    color: Colors.blue, size: ScreenUtil().setSp(15)),
              ),
              Expanded(
                flex: 4,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    'New\nReminder',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(15)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'Details',
        style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w700),
      ),
      actions: [
        GestureDetector(
          child: GestureDetector(
            onTap: () => {
                      Navigator.pop(context,({'date':item.date,'time':item.time,'priority':item.priority})),
            },
            child: Container(
              //color: Colors.blue,
              width: ScreenUtil().screenWidth / 6,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Save',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: ScreenUtil().setSp(15),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
