import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/Createtodo/Widgets/ProvidesTitleNode.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';

class listviewPersonal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: context.watch<ProvidesTitleNode>().Personal.length,
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(15), 0, ScreenUtil().setWidth(10), 0),
        itemBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(5)),
              height: ScreenUtil().setHeight(60),
              color: Colors.transparent,
              child: Row(
                children: [
                  Text(
                    '${context.watch<ProvidesTitleNode>().Personal[index]['time']}',
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.w600,
                        fontSize: ScreenUtil().setSp(20)),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Container(
                    width: 2,
                    height: ScreenUtil().setHeight(40),
                    color: Colors.blue,
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(10),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${context.watch<ProvidesTitleNode>().Personal[index]['title']}',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(17)),
                      ),
                      Text(
                        '${context.watch<ProvidesTitleNode>().Personal[index]['node']}',
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: ScreenUtil().setSp(14)),
                      ),
                    ],
                  )
                ],
              ));
        });
  }
}
