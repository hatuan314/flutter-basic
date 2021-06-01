import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/create_new_list.dart';

import '../homepage_provider.dart';
import '../bloc/homepage_stream.dart';
class BottomBar extends StatelessWidget
{BuildContext context; HomeStream homeStream;

BottomBar(this.context, {this.homeStream});

  @override
  Widget build(BuildContext context) {
    //int value;
    Color listColor=Colors.blue;
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                  onTap: () async
                  {await Navigator.pushNamed(context, RouteList.createNewScreen)
                      .whenComplete(()=>
                      homeStream.update()) ;
                  },
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(2)),
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: ScreenUtil().setSp(20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                      child: Text(
                        'New Reminder',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.blue),
                      ),
                    )
                  ]))),
          Expanded(
              child: GestureDetector(
                onTap: () async
                {await Navigator.push(context, MaterialPageRoute(builder: (context)=>NewList()))
                    .whenComplete(()=>
                    homeStream.update()) ;
                },
                child: Text(
                  'Add List',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.blue),
                ),
              ))
        ],
      ),
    );
  }

}
