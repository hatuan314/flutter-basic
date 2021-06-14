import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/bloc/list_group_bloc.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/list_group/list_group_constants.dart';
import 'package:ghichu/presentation/journey/reminder/create_reminder/widgets/list_group_widget.dart';

import 'package:ghichu/presentation/journey/reminder/widgets/app_bar_reminder.dart';
import 'package:ghichu/presentation/models/model_map.dart';

// ignore: must_be_immutable
class ListGroupScreen extends StatefulWidget {
  int index;
  List<String> list;
  ListGroupScreen({this.index, this.list});
  @override
  _ListReminderpageState createState() => _ListReminderpageState();
}

class _ListReminderpageState extends State<ListGroupScreen> {
  ListGroupBloc listGroupBloc = ListGroupBloc();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      listGroupBloc.setIndex(widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBarReminderWidget(
        leading: () {
          Navigator.pop(context);
        },
        textLeft: ListGroupConstants.appBarLeadingTxt,
        title: ListGroupConstants.titleTxt,
        textRight: Text(''),
      ),
      body: Column(
        children: List.generate(widget.list.length, (index) {
          return ListGroupWidget(
            listGroupBloc: listGroupBloc,
            title: ModelListReminder.myList['${widget.list[index]}'].title,
            color: ModelListReminder.myList['${widget.list[index]}'].color,
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
