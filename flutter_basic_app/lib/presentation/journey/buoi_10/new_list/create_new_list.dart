import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_10/new_list/list_provider.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';

import '../reminders_list.dart';
class NewList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final item = Provider.of<NewListProvider>(context);
    return SafeArea(child: Scaffold(
      appBar: _appBar(context),
 body: ListView(
   shrinkWrap: true,
   scrollDirection: Axis.vertical,
   children: [
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
       padding:   EdgeInsets.all(ScreenUtil().setHeight(20)),
       child: TextField(
    //   controller: textName,
         maxLines: 1,
         textCapitalization: TextCapitalization.sentences,
         textAlign: TextAlign.start,
         onChanged: (value) => {
           item.setName(value),
         },
         decoration: InputDecoration(
           hintText: 'Name',
           hintStyle: TextStyle(
               fontSize: ScreenUtil().setSp(15),
               fontFamily: 'MS',
               fontWeight: FontWeight.w500,
               color: Colors.grey),

         ),
       ),
     ),
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(15)),
              height: ScreenUtil().screenWidth,
              width: ScreenUtil().screenWidth-20,
              child: MaterialColorPicker(
                colors: [
                  Colors.blue,Colors.red, Colors.green, Colors.pink, Colors.orange, Colors.yellow
                ],
                selectedColor: item.listColor,
                onColorChange: (selected)=>item.setColor(selected),
              ),
            )]),

    )

 );


  }

  Widget _appBar(BuildContext context)
  {
    final item = Provider.of<NewListProvider>(context);
    final AlertDialog errorDialog = AlertDialog(
      title:Text('Data is invalid'),
      actions: [
        FlatButton(
          onPressed: () {Navigator.pop(context);},
          child: Text('OK'),
        ),
      ],
    );
    return AppBar(
      elevation: 0,
      leadingWidth: ScreenUtil().screenWidth / 5,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
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
        GestureDetector(
          child: GestureDetector(
            onTap: () => {
              if(item.name==null || item.name.isEmpty)
                {
                  showDialog(context: context, builder: (context)=> errorDialog)
                }
              else
                {
                  RemindersList.addList(item.name,item.listColor),
                  Navigator.pop(context)
                }
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
        ),
      ],
    );
  }
}