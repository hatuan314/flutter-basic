
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/home_Page/ProviderHomePage.dart';
import 'package:provider/provider.dart';

class editWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: !context.watch<providerhomePage>().edit,
      child: Container(
        margin: EdgeInsets.only(top: ScreenUtil().setHeight(20)),
        width: ScreenUtil().screenWidth,
        height: ScreenUtil().setHeight(180),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ReorderableListView(
          physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: <Widget>[
              for (int index = 0; index < constHomePage.list.length; index++)
                Row(
                  key: Key('${index}'),
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: ScreenUtil().setHeight(5),left: ScreenUtil().setWidth(20)),
                      padding: EdgeInsets.all(5),
                      width: ScreenUtil().setWidth(30),
                      height: ScreenUtil().setWidth(30),
                      decoration: BoxDecoration(
                          color: context.watch<providerhomePage>().data[index]['colors'], shape: BoxShape.circle),
                      child: Icon(
                        context.watch<providerhomePage>().data[index]['icons'],
                        color: Colors.white,
                        size: ScreenUtil().setSp(20),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(10),
                    ),
                    Expanded(
                      child: Container(
                        key: Key('$index'),
                        height: ScreenUtil().setHeight(50),
                        margin: EdgeInsets.only(top: 10),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border(bottom: BorderSide(color: index==2? Colors.transparent:Colors.black26))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${context.watch<providerhomePage>().data[index]['title']}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w400,fontSize: ScreenUtil().setSp(13)),),
                            Padding(
                              padding:  EdgeInsets.only(right: ScreenUtil().setWidth(10)),
                              child: Icon(Icons.list,size: ScreenUtil().setSp(25),color: Colors.black38,),
                            )
                          ],
                        )
                      ),
                    )
                  ],
                )
            ],
            
            onReorder: (int oldIndex, int newIndex) {
              context.read<providerhomePage>().setlist();
              if (oldIndex < newIndex) {
                newIndex -= 1;
              }
              var item = constHomePage.list.removeAt(oldIndex);
              constHomePage.list.insert(newIndex, item);
            }),
      ),
    );
  }
}
