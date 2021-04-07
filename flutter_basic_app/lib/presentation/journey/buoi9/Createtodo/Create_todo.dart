import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/Createtodo/Widgets/HedearWidgets.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/Createtodo/Widgets/ProvidesTitleNode.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/Createtodo/Widgets/bodyWidgets.dart';
import 'package:flutter_basic_app/presentation/journey/buoi9/ProvidesTimer.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:provider/provider.dart';
class createTodo extends StatefulWidget {
  @override
  _createTodoState createState() => _createTodoState();
}

class _createTodoState extends State<createTodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body:SingleChildScrollView(
        child: Column(
          children: [
            headerWidget(),
            bodyWidgets(),
          ],
        ),
      ),
    );
  }
}
