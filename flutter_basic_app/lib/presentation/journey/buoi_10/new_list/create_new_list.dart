import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/new_list/list_provider.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';

import '../reminders_list.dart';

class NewList extends StatelessWidget {
  TextEditingController name = TextEditingController();
  @override
  Widget build(BuildContext context) {

    final item = Provider.of<NewListProvider>(context);
    return SafeArea(
        child: Scaffold(
      appBar: _appBar(context),
      body:
          ListView(shrinkWrap: true, scrollDirection: Axis.vertical, children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
// alignment: Alignment.topLeft,
            padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: item.listColor,
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
            child: item.clearButton==false
                ? Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300,
                    ),
                    child: TextField(
                      controller: name,
                      maxLines: 1,
                      onTap: ()=>{item.setClearButton(true), item.setName(name.text)},
                      textCapitalization: TextCapitalization.sentences,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  )
                : Container(
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
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => name.clear(),
                          child: Container(
                            padding: EdgeInsets.all(ScreenUtil().setHeight(2)),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.grey),
                            child: Icon(
                              Icons.clear,
                              size: ScreenUtil().setSp(15),
                            ),
                          ),
                        ),
                      )
                    ]))),
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
            selectedColor: item.listColor,
            onColorChange: (selected) => item.setColor(selected),
          ),
        )
      ]),
    ));
  }

  Widget _appBar(BuildContext context) {
    final item = Provider.of<NewListProvider>(context);
    final AlertDialog errorDialog = AlertDialog(
      title: Text('Data is invalid'),
      actions: [
        FlatButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('OK'),
        ),
      ],
    );
    return AppBar(
      elevation: 0,
      leadingWidth: ScreenUtil().screenWidth / 5,
      leading: GestureDetector(
        onTap: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(title: Text('Cancel ?'), actions: [
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No'),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text('Yes'),
                  ),
                ])),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'Cancel',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w600,
                fontSize: ScreenUtil().setSp(15)),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      centerTitle: true,
      title: Text(
        'New List',
        style: TextStyle(
            color: Colors.black,
            fontSize: ScreenUtil().setSp(16),
            fontWeight: FontWeight.w700),
      ),
      actions: [
        //(item.name == null || item.name.isEmpty)
       // (name.text==null || name.text.isEmpty)
        item.clearButton==false
            ? GestureDetector(
                onTap: () => {},
                child: Container(
                  //color: Colors.blue,
                  width: ScreenUtil().screenWidth / 6,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: () => {
                  /*  if(item.name==null || item.name.isEmpty)
                {
                  showDialog(context: context, builder: (context)=> errorDialog)
                }
              else
                {*/
                  RemindersList.addList(name.text, item.listColor),
                  Navigator.pop(context)
                  //  }
                },
                child: Container(
                  //color: Colors.blue,
                  width: ScreenUtil().screenWidth / 6,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Add',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: ScreenUtil().setSp(15),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
