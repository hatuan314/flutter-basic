import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:hive/hive.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/add_list_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/add_list_event.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/add_list_state.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/create_list_state.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/list_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminders_list.dart';
import 'package:reminders_app/reminders_app/presentation/model/boxex.dart';
import 'package:reminders_app/reminders_app/presentation/model/group.dart';
import 'package:reminders_app/reminders_app/presentation/theme/theme.dart';
import 'package:reminders_app/reminders_app/presentation/widgets_constants/appbar.dart';

import 'package:reminders_app/reminders_app/common/extensions/date_extensions.dart';
class NewList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewList();
}

class _NewList extends State<NewList> {
  ListStream listStream = ListStream();
  TextEditingController name = TextEditingController();

  @override
  void dispose() {
 //   Hive.close();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return BlocProvider<AddListBloc>(
      create: (context) => AddListBloc(),
      child: BlocBuilder<AddListBloc, AddListState>(
        builder: (context, state) {
          return Scaffold(
            appBar: _appbar(state),
            body: ListView(shrinkWrap: true, children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: state.selectColor,
                  ),
                  child: Icon(
                    Icons.list,
                    size: ScreenUtil().setSp(80),
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(20)),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300,
                    ),
                    child: Row(children: [
                      Expanded(
                        flex: 5,
                        child: TextField(
                          controller: name,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: ScreenUtil().setSp(23)),
                          maxLines: 1,
                          textCapitalization:
                          TextCapitalization.sentences,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          onChanged: (value) {
                            if (value.isNotEmpty) {
                              BlocProvider.of<AddListBloc>(context)
                                  .add(ActiveAddButtonEvent(activeAddButton: true));
                            } else {
                              BlocProvider.of<AddListBloc>(context)
                                  .add(ActiveAddButtonEvent(activeAddButton: false));
                            }
                          },
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Visibility(
                          visible: state.activeAddBtn,
                          child: GestureDetector(
                            onTap: () => {
                              name.clear(),
                              BlocProvider.of<AddListBloc>(context)
                                  .add(ActiveAddButtonEvent(activeAddButton: false)),
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                  ScreenUtil().setHeight(2)),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey),
                              child: Icon(
                                Icons.clear,
                                size: ScreenUtil().setSp(15),
                              ),
                            ),
                          ),
                        ),
                      )
                    ])),
              ),
              selectColor(context, state),
            ]),
          );
        },
      ),
    );
  }

  Future addList(String name, Color color, String createAt, String lastUpdate)
  {
    final g= Group()
        ..name=name
    ..color=color
        ..createAt=createAt
        ..lastUpdate=lastUpdate;

    final box= Boxes.getGroup();
    box.add(g);
    log('added');
  }

  Widget selectColor(BuildContext context, AddListState state) {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().screenWidth,
      width: ScreenUtil().screenWidth - 20,
      child: MaterialColorPicker(
          colors: [
            Colors.blue,
            Colors.green,
            Colors.red,
            Colors.pink,
            Colors.orange,
            Colors.yellow,
            Colors.brown,
          ],
          selectedColor: state.selectColor,
          onColorChange: (selected) {
            // listStream.setColor(selected),
            BlocProvider.of<AddListBloc>(context)
                .add(SelectColorEvent(color: selected));
            // log(state.selectColor.toString())
          }),
    );
  }

  Widget _appbar(AddListState state) {
    return AppbarWidget(
      context,
      leadingText: 'Cancel',
      title: 'New List',
      onTapAction: GestureDetector(
        onTap: () {
          if (state.activeAddBtn) {
           // addList(name.text, state.selectColor, DateTime.now().dateDdMMyyyy,DateTime.now().dateDdMMyyyy );
            RemindersList.addList(name.text, state.selectColor);
            Navigator.pop(context);
          }
        },
        child: Container(
            width: ScreenUtil().screenWidth / 6,
            child: Align(
              alignment: Alignment.center,
              child: Text('Add',
                  style: ThemeText.actionButton.copyWith(
                    color:
                    state.activeAddBtn ? Colors.blue : Colors.grey,
                  )),
            )),
      ),
    );
  }
}
