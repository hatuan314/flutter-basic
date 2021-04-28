import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/reminder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreateNewReminder extends StatelessWidget {
  String title;
  String notes;
  DateTime date;
  String time;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _appBar(context),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(
                ScreenUtil().setWidth(10),
              ),
              child: Container(
                  padding: EdgeInsets.all(ScreenUtil().setHeight(15)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      TextField(
                        // controller: textTitle,
                        maxLines: 1,
                        textCapitalization: TextCapitalization.sentences,
                        textAlign: TextAlign.start,
                        onChanged: (value) => {
                          context.read<Reminder>().setTitle(value),
                          title = value,
                          //  log(title),
                        },

                        decoration: InputDecoration(
                          hintText: 'Title',
                          hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              fontFamily: 'MS',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          // enabled: false,
                          //   border: InputBorder.none,
                        ),
                      ),
                      TextField(
                        // controller: textTitle,
                        maxLines: 3,
                        textCapitalization: TextCapitalization.sentences,
                        textAlign: TextAlign.start,
                        onChanged: (value) => {
                          context.read<Reminder>().setNote(value),
                          notes = value,
                          //  log(title),
                        },

                        decoration: InputDecoration(
                          hintText: 'Notes',
                          hintStyle: TextStyle(
                              fontSize: ScreenUtil().setSp(15),
                              fontFamily: 'MS',
                              fontWeight: FontWeight.w500,
                              color: Colors.grey),
                          // enabled: false,
                          border: InputBorder.none,
                        ),
                      ),
                    ],
                  )),
            ),
            Padding(
                padding: EdgeInsets.all(
                  ScreenUtil().setWidth(10),
                ),
                child: Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Text(
                            'Details',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
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
                )),
            Padding(
                padding: EdgeInsets.all(
                  ScreenUtil().setWidth(10),
                ),
                child: Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(7)),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(8.0)),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 9,
                          child: Text(
                            'Details',
                            style: TextStyle(
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
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
                )),
          ],
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leadingWidth: ScreenUtil().screenWidth / 5,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Cancel',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(15)),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'New Reminder',
        style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w700),
      ),
      actions: [
        GestureDetector(
          child: GestureDetector(
            onTap: () => {context.read<Reminder>().addReminder(),
            Navigator.pop(context),
  },
            child: Container(
              //color: Colors.blue,
              width: ScreenUtil().screenWidth / 6,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Add',
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
