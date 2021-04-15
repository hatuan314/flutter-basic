import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/bottom_navigation_bar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/create_todo_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
class CreateToDo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CreateTodoItem().header(context),
          Stack(
            children: [
              Container(
              height: ScreenUtil().screenHeight,
                  width: ScreenUtil().screenWidth,
                  color: Color.fromRGBO(13, 71, 161, 1)
              ),
              Positioned(
              //    top: ScreenUtil().screenHeight/4,
                  child: CreateTodoItem().build(context)),
            ],
          )

        ],

      ),
   //   bottomNavigationBar: bnBar(context, 1),
    );
  }

}