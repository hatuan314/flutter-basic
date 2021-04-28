

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ghi_chu/New_Reminder/ProviderReminder.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
class DetailsWidget extends StatelessWidget {
  var values;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
       values = await Navigator.pushNamed(context, RouteList.details);
       print('$values');
        context.read<providerReminder>().getvaluetime(values);
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
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               Text('Details',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: ScreenUtil().setSp(23)),),
               Visibility(
                 visible: context.watch<providerReminder>().valuestime==null?false:true,
                   child:Row(
                     children: [
                     Text(context.watch<providerReminder>().valuestime==null?'':context.watch<providerReminder>().valuestime[0]['time']==''?'':'${context.watch<providerReminder>().valuestime[0]['time'][0]}:${context.watch<providerReminder>().valuestime[0]['time'][1]}, ',style: TextStyle(color: Colors.black87.withOpacity(0.6),fontSize: ScreenUtil().setSp(14)),),
                       Text(context.watch<providerReminder>().valuestime==null?'':'ngày ${context.watch<providerReminder>().valuestime[0]['date'].day} thg ${context.watch<providerReminder>().valuestime[0]['date'].month}, ${context.watch<providerReminder>().valuestime[0]['date'].year}',style: TextStyle(color: Colors.black87.withOpacity(0.6),fontSize: ScreenUtil().setSp(14)))
                     ],
                   )
               )
             ],
           ),
            Icon(Icons.navigate_next_outlined,size: ScreenUtil().setSp(30),color: Colors.black45,)
          ],
        ),
      ),
    );
  }
}
