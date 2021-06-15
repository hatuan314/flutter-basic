import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/bloc/list_group_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/bloc/list_group_state.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/list_group_constants.dart';

// ignore: must_be_immutable
class ListGroupWidget extends StatelessWidget {
  String color;
  String title;
  int index;
  bool isIcon;
  ListGroupBloc listGroupBloc;
  Function onTap;
  ListGroupWidget(
      {Key key,
      this.isIcon,
      this.color,
      this.title,
      this.index,
      this.listGroupBloc,
      this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: ListGroupConstants.paddingHeight10),
        width: double.infinity,
        height: ListGroupConstants.heightContainer,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.only(
              left: ListGroupConstants.paddingWitdh10,
              right: ListGroupConstants.paddingWitdh10),
          child: Row(
            children: [
              isIcon
                  ? Container(
                      width: ListGroupConstants.sizeIcon,
                      height: ListGroupConstants.sizeIcon,
                      decoration: BoxDecoration(
                          color: Color(int.parse(color)),
                          shape: BoxShape.circle),
                      child: Center(
                          child: Icon(
                        Icons.list,
                        color: Colors.white,
                        size: ScreenUtil().setSp(22),
                      )),
                    )
                  : SizedBox(),
              SizedBox(
                width: ScreenUtil().setWidth(15),
              ),
              Expanded(
                child: Container(
                    height: ScreenUtil().setHeight(55),
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black45, width: 0.3))),
                    child: StreamBuilder<ListGroupState>(
                        initialData: listGroupBloc.listGroupState,
                        stream: listGroupBloc.selectIndex,
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '$title',
                                style: ListGroupConstants.titleGroup,
                              ),
                              index == snapshot.data.indexCheck
                                  ? Icon(
                                      Icons.check_sharp,
                                      color: Colors.blue,
                                      size: ScreenUtil().setSp(22),
                                    )
                                  : SizedBox()
                            ],
                          );
                        })),
              )
            ],
          ),
        ),
      ),
    );
  }
}
