import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/bloc/list_group_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/widgets/list_group_widget.dart';
import 'package:ghichu/presentation/models/model_map.dart';

class ListGroupScreen extends StatefulWidget {
  @override
  _ListReminderpageState createState() => _ListReminderpageState();
}

class _ListReminderpageState extends State<ListGroupScreen> {
  Map<String, dynamic> model;
  ListGroupBloc listGroupBloc = ListGroupBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listGroupBloc.setIndex(model['index']);
    });
  }

  @override
  Widget build(BuildContext context) {
    model = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                size: ScreenUtil().setSp(21),
                color: Colors.blue,
              ),
              Text(
                'Lời nhắc mới',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
              )
            ],
          ),
        ),
        leadingWidth: ScreenUtil().setWidth(130),
        title: Text(
          'Danh sách',
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(18)),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: List.generate(model['list'].length, (index) {
          return ListGroupWidget(
            listGroupBloc: listGroupBloc,
            title: ModelListReminder.myList['${model['list'][index]}'].title,
            color: ModelListReminder.myList['${model['list'][index]}'].color,
            index: index,
          );
        }),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
listGroupBloc.dispose();
    super.dispose();
  }
}
