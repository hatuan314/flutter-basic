import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc_add_list.dart';

import '../add_list_constaner.dart';
class SelectColors extends StatelessWidget {
  BlocAddList blocAddList;

  SelectColors({Key key,this.blocAddList}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children:
      List.generate(AddListConstants.listColors.length, (index) {
        return GestureDetector(
          onTap: () {
            blocAddList.setColor(index, AddListConstants.listColors[index]);
          },
          child: StreamBuilder<Object>(
            stream: blocAddList.selectColor,
            builder: (context, snapshot) {
              return Container(
                margin: EdgeInsets.only(
                    left:AddListConstants.paddingWith,
                    top: AddListConstants.paddingHeight10),
                height: AddListConstants.sizeContainerColor,
                width: AddListConstants.sizeContainerColor,
                padding: EdgeInsets.all(ScreenUtil().setSp(3)),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: index == blocAddList.index
                            ? Colors.black45
                            : Colors.transparent,
                        width: 2),
                    shape: BoxShape.circle),
                child: Container(
                  height: AddListConstants.sizeContainerColor,
                  width: AddListConstants.sizeContainerColor,
                  decoration: BoxDecoration(
                      color: AddListConstants.listColors[index],
                      shape: BoxShape.circle),
                ),
              );
            }
          ),
        );
      }),
    );
  }
}
