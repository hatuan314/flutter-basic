import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../todo_item.dart';

class PersonalEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            left: ScreenUtil().setHeight(30),
            right: ScreenUtil().setHeight(30)),
        child: Container(
          height: ScreenUtil().screenWidth - 130,
          width: ScreenUtil().screenWidth - 60,
          decoration: BoxDecoration(
              color: Colors.blue[100],
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    spreadRadius: 2)
              ]),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top:ScreenUtil().setHeight(10)),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Personal',
                          style: TextStyle(
                            fontSize: ScreenUtil().setSp(20),
                            fontFamily: 'MS',
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(13, 71, 161, 1),
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.only(left: ScreenUtil().setHeight(2)),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(13, 71, 161, 1),
                                shape: BoxShape.circle),
                            child: FittedBox(
                              child: Text(
                                // '${TodoListForDay.length}',
                                '${context.watch<TodoItem>().todoList.length}',
                                style: TextStyle(
                                  fontSize: ScreenUtil().setSp(16),
                                  fontFamily: 'MS',
                                  //fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ])),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(bottom:ScreenUtil().setHeight(12),
                  right:ScreenUtil().setWidth(12),
                  left:ScreenUtil().setWidth(12), ),
                  child: ListView.builder(
                    

                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      // itemCount: TodoListForDay.length,
                      itemCount: context.watch<TodoItem>().todoList.length,
                      itemBuilder: (context, index) {
                        return Container(
                       //   color: Colors.redAccent,
                          height: ScreenUtil().screenWidth/7,
                          width: ScreenUtil().screenWidth - 100,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: Text(
                                  ''
                                  // '${TodoListForDay[index].time}',
                                  '${context.watch<TodoItem>().todoList[index]['time']}',
                                  style: TextStyle(

                                    fontSize: ScreenUtil().setSp(20),
                                    fontFamily: 'MS',
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromRGBO(13, 71, 161, 1),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10),
                                right: ScreenUtil().setWidth(10),),
                                child: Container(
                                color: Color.fromRGBO(13, 71, 161, 1),
                                  width: ScreenUtil().setWidth(1),
                                  height: ScreenUtil().setHeight(40),
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    //'${TodoListForDay[index].title}',
                                    '${context.watch<TodoItem>().todoList[index]['title']}',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      fontFamily: 'MS',
                                      fontWeight: FontWeight.w600,
                                      color: Color.fromRGBO(13, 71, 161, 1),
                                    ),
                                  ),
                                  Text(
                                    // '${TodoListForDay[index].note}',
                                    '${context.watch<TodoItem>().todoList[index]['note']}',
                                    style: TextStyle(
                                      fontSize: ScreenUtil().setSp(20),
                                      fontFamily: 'MS',
                                      fontWeight: FontWeight.w300,
                                      color: Color.fromRGBO(13, 71, 161, 1),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        ));
  }
}
