
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/new_reminder/provider_reminder.dart';
import 'package:provider/provider.dart';
class ListReminder extends StatelessWidget {
  var value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       value=await Navigator.pushNamed(context, RouteList.listReminderPage,arguments: Provider.of<ProviderReminder>(context,listen: false).index);
       context.read<ProviderReminder>().setGroup(value['title'],value['index']);
      },
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(25)),
        height: ScreenUtil().setHeight(60),
        width: double.infinity,
        padding: EdgeInsets.only(left: ScreenUtil().setWidth(20),right: ScreenUtil().setWidth(20)),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(9))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('List',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: ScreenUtil().setSp(23)),),
           Row(
             children: [
               Text('${context.watch<ProviderReminder>().group}',style: TextStyle(color: Colors.black54,fontSize: ScreenUtil().setSp(20)),),
               Icon(Icons.navigate_next_outlined,size: ScreenUtil().setSp(30),color: Colors.black45,)
             ],
           )
          ],
        ),
      ),
    );
  }
}
