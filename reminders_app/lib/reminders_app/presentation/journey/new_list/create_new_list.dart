import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/presentation/journey/new_list/bloc/create_list_state.dart';
import 'package:reminders_app/reminders_app/presentation/journey/new_list/bloc/list_stream.dart';
import 'package:reminders_app/reminders_app/presentation/journey/reminders_list.dart';

import 'widget/appbar.dart';

class NewList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewList();
}

class _NewList extends State<NewList> {
  ListStream listStream = ListStream();
  TextEditingController name = TextEditingController();

  @override
  void dispose() {
    listStream.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return StreamBuilder<CreateListState>(
        initialData:
            CreateListState(listColor: Colors.blue, clearButton: false),
        stream: listStream.createListStream,
        builder: (context, snapshot) {
          return SafeArea(
              child: Scaffold(
            appBar: appBar(context,
                name: name,
                createListState: snapshot.data,
                onDone: (name, color) {
                  RemindersList.addList(name,color);
                }),
            body: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: snapshot.data.listColor,
                      ),
                      child: Icon(
                        Icons.list,
                        size: ScreenUtil().setSp(80),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(
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
                            textCapitalization: TextCapitalization.sentences,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              // filled: true,
                              border: InputBorder.none,
                            ),
                            onChanged: (value) {
                              if (value.isNotEmpty) {
                                listStream.setClearButton(true);
                              } else {
                                listStream.setClearButton(false);
                              }
                            },
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Visibility(
                            visible: snapshot.data.clearButton,
                            child: GestureDetector(
                              onTap: () => name.clear(),
                              child: Container(
                                padding:
                                    EdgeInsets.all(ScreenUtil().setHeight(2)),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.grey),
                                child: Icon(
                                  Icons.clear,
                                  size: ScreenUtil().setSp(15),
                                ),
                              ),
                            ),
                          ),
                        )
                      ])),
                  Container(
                    height: ScreenUtil().screenWidth,
                    width: ScreenUtil().screenWidth - 20,
                    child: MaterialColorPicker(
                        colors: [
                          Colors.blue,
                          Colors.red,
                          Colors.green,
                          Colors.pink,
                          Colors.orange,
                          Colors.yellow
                        ],
                        selectedColor: snapshot.data.listColor,
                        onColorChange: (selected) => {
                              listStream.setColor(selected),
                              log(snapshot.data.toString())
                            }),
                  ),
                ]),
          ));
        });
  }
}
