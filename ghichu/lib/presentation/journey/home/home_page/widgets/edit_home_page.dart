import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';
import 'package:ghichu/presentation/journey/widgets/icon_widget.dart';

class EditWidget extends StatelessWidget {
  CheckButtonBloc blocCheckButton;

  EditWidget({Key key, this.blocCheckButton}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
        stream: blocCheckButton.checkButton,
        builder: (context, snapshot) {
          return Visibility(
            visible: blocCheckButton.check,
            maintainAnimation: true,
            maintainState: true,
            child: AnimatedOpacity(
              opacity: blocCheckButton.check ? 1 : 0,
              duration: HomePageConstants.durationContainer,
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
                      for (int index = 0;
                          index < HomePageConstants.list.length;
                          index++)
                        Row(
                          key: Key('$index'),
                          children: [
                            SizedBox(
                              width: HomePageConstants.paddingWidth10,
                            ),
                            IconWidget(
                              icon: HomePageConstants.list[index]['icons'],
                              shadow: 0,
                              color: Color(HomePageConstants
                                  .list[index]['colors'].value),
                              colorGraient: Color(HomePageConstants
                                  .list[index]['colors'].value),
                            ),
                            SizedBox(
                              width: ScreenUtil().setWidth(10),
                            ),
                            Expanded(
                              child: Container(
                                  key: Key('$index'),
                                  height: ScreenUtil().setHeight(50),
                                  margin: EdgeInsets.only(
                                      top: ScreenUtil().setHeight(10)),
                                  alignment: Alignment.centerLeft,
                                  decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      border: Border(
                                          bottom: BorderSide(
                                              color: index == 2
                                                  ? Colors.transparent
                                                  : Colors.black26))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${HomePageConstants.list[index]['title']}",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400,
                                            fontSize: ScreenUtil().setSp(13)),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            right: ScreenUtil().setWidth(10)),
                                        child: Icon(
                                          Icons.list,
                                          size: ScreenUtil().setSp(25),
                                          color: Colors.black38,
                                        ),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        )
                    ],
                    onReorder: (int oldIndex, int newIndex) {
                      if (oldIndex < newIndex) {
                        newIndex = newIndex - 1;
                      }
                      var item = HomePageConstants.list.removeAt(oldIndex);
                      HomePageConstants.list.insert(newIndex, item);
                   blocCheckButton.checkButtom.sink.add('w');
                    }),
              ),
            ),
          );
        });
  }
}
