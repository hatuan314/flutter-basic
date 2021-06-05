

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/common/constants/string_constants.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';
import 'package:ghichu/presentation/journey/widgets/icon_widget.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class MyListWidget extends StatelessWidget {
  int index;
  String keyGroup;
  String title;
  int leght=0;
  String color;
  MyListWidget({Key key, this.index,this.title,this.leght,this.color,this.keyGroup}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, RouteList.todayPage,arguments: {StringConstants.keyGroup:keyGroup});
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: index == 0
                  ? HomePageConstants.radiusCircle15
                  : Radius.circular(0),
              topRight: index == 0
                  ? HomePageConstants.radiusCircle15
                  : Radius.circular(0),
              bottomLeft: index == ModelListReminder.myList.length-1
                  ? HomePageConstants.radiusCircle15
                  : Radius.circular(0),
              bottomRight: index == ModelListReminder.myList.length-1
                  ? HomePageConstants.radiusCircle15
                  : Radius.circular(0),
            )),
        child: Row(
          children: [
            SizedBox(
              width: HomePageConstants.paddingWidth10,
            ),
            IconWidget(
              icon: Icons.list,
              shadow: 0,
              colorGraient: Color(int.parse(color)),
              color: Color(int.parse(color)),

            ),
            SizedBox(
              width: HomePageConstants.paddingWidth10,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: HomePageConstants.paddingHeight20),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                            color: index == ModelListReminder.myList.length-1
                                ? Colors.transparent
                                : Colors.black12))),
                child: Row(
                  children: [
                    Container(
                      width: HomePageConstants.widthGroupText270,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: ScreenUtil().setSp(18)),
                      ),
                    ),
                    Expanded(
                      child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '$leght',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: ScreenUtil().setSp(16)),
                          )),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.black26,
                        size: ScreenUtil().setSp(20),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(5),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
