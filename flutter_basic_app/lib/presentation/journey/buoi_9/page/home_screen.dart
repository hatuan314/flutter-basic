import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/page/schedule_screen.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/bottom_navigation_bar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_9/widget/create_todo_item.dart';

import 'create_to_do.dart';

class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>
{
  int index=0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: bnBar(context),
        body: IndexedStack(
          index: index,
          children: [
            ScheduleScreen(),
          CreateToDo(),
          ],
        ),
      ),
    );
  }

  Widget bnBar (BuildContext context)
  {
    return Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.event_note),
                onPressed: ()=>
                {
                  //Navigator.popAndPushNamed(context, RouteList.b9Src3),
                  setState(()=>
                  index=0,)
                }
            ),
          ),
          Expanded(
            flex: 1,
            child:IconButton(
              icon: Icon(Icons.search),
            ),
          ),
          Expanded(
            flex: 1,
            child:
            IconButton(
                icon: Icon(Icons.work_outline),
                onPressed: ()=>
                {
                  //Navigator.popAndPushNamed(context, RouteList.b9Src2),
                  setState(()=>
                  index=1,)
                }
            ),
          ),
          Expanded(
            flex: 1,
            child:
            IconButton(
              icon: Icon(Icons.power_settings_new_outlined),
            ),
          ),


        ],
      ),
    );
  }
}