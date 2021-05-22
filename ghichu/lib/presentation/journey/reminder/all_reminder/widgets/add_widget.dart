import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghichu/common/constants/route_constants.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/bloc/all_reminder_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/all_reminder/bloc/all_reminder_state.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class AddWidget extends StatelessWidget {
  String group;
  List<TextEditingController> controller;
  int index;
  AllReminderBloc allReminderBloc;
  AddWidget(
      {Key key, this.group, this.controller, this.index, this.allReminderBloc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller[index],
      onTap: () {
        allReminderBloc.allReminderState.indexReminder = null;
        if (index != allReminderBloc.allReminderState.indexGroup) {
          for (int i = 0; i < ModelListReminder.myList.length; i++) {
            if (controller[i].text.isNotEmpty &&
                index != allReminderBloc.allReminderState.indexGroup) {
              allReminderBloc.addAll(
                  allReminderBloc.allReminderState.group, controller[i].text);
            }
            controller[i].text = '';
          }
        }
        allReminderBloc.allReminderState.setGroup(group);
        allReminderBloc.setIndexGroup(index);
      },
      style: TextStyle(fontSize: ScreenUtil().setSp(16)),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1.5),
        ),
        suffixIcon: StreamBuilder<AllReminderState>(
          initialData: allReminderBloc.allReminderState,
          stream: allReminderBloc.allController,
          builder: (context, snapshot) {
            return Visibility(
                visible: index == snapshot.data.indexGroup
                    ? true
                    : false,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RouteList.editReminder,
                        arguments: {
                          'group': group,
                          'title': controller[index].text,
                          'note': '',
                          'date': null,
                          'time': false,
                          'createAt':DateTime.now().millisecondsSinceEpoch,
                          'reminder':'none'
                        }).whenComplete((){
                      for (int i = 0; i < ModelListReminder.myList.length; i++) {
                        controller[i].text = '';
                      }
                      allReminderBloc.update();
                    });
                  },
                  child: Icon(
                    Icons.error_outline,
                    size: ScreenUtil().setSp(23),
                    color: Colors.red,
                  ),
                ));
          }
        ),
        prefixIcon: Icon(
          Icons.add_circle_outlined,
          size: ScreenUtil().setSp(25),
          color: Colors.black45,
        ),
        helperStyle:
            TextStyle(color: Colors.black45, fontSize: ScreenUtil().setSp(13)),
      ),
    );
  }
}
