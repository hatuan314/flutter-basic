import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc/add_list_bloc.dart';
import 'package:ghichu/presentation/journey/group/add_list/bloc/add_list_state.dart';

import '../add_list_constaner.dart';

class SelectColors extends StatelessWidget {
  AddListBloc addListBloc;

  SelectColors({Key key, this.addListBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(AddListConstants.listColors.length, (index) {
        return GestureDetector(
          onTap: () {
            addListBloc.setColor(index, AddListConstants.listColors[index]);
          },
          child: StreamBuilder<AddListState>(
              initialData: addListBloc.addListState,
              stream: addListBloc.selectColor,
              builder: (context, snapshot) {
                return Container(
                  margin: EdgeInsets.only(
                      left: AddListConstants.paddingWith,
                      top: AddListConstants.paddingHeight10),
                  height: AddListConstants.sizeContainerColor,
                  width: AddListConstants.sizeContainerColor,
                  padding: EdgeInsets.all(ScreenUtil().setSp(3)),
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: index == snapshot.data.index
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
              }),
        );
      }),
    );
  }
}
