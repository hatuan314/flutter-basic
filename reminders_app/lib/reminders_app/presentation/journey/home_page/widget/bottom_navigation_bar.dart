import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:reminders_app/reminders_app/common/constants/route_constants.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/bloc/homepage_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/home_page/bloc/homepage_event.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/bloc/add_list_bloc.dart';
import 'package:reminders_app/reminders_app/presentation/journey/list/new_list/create_new_list.dart';

import '../../reminders_list.dart';
import '../homepage_provider.dart';
import '../bloc/homepage_stream.dart';
class BottomBar extends StatelessWidget
{BuildContext context1;

BottomBar(this.context1 );

  @override
  Widget build(BuildContext context) {
    //int value;
    Color listColor=Colors.blue;
    return Container(
      padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                  onTap: () async
                  {await Navigator.pushNamed(context, RouteList.createNewScreen)
                      .whenComplete(()=>
                      BlocProvider.of<HomeBloc>(context1).add(UpdateEvent( ))) ;
                  },
                  child: Row(children: [
                    Container(
                      padding: EdgeInsets.all(ScreenUtil().setWidth(2)),
                      decoration: BoxDecoration(
                          color: Colors.blue, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: ScreenUtil().setSp(20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(ScreenUtil().setHeight(8)),
                      child: Text(
                        'New Reminder',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil().setSp(15),
                            color: Colors.blue),
                      ),
                    )
                  ]))),
          Expanded(
              child: GestureDetector(
                onTap: () async
                {await Navigator.push(context, MaterialPageRoute(builder: (context)=> BlocProvider<AddListBloc>(
                    create: (context) => AddListBloc(), child: NewList())))
                    .whenComplete(()=>
                    BlocProvider.of<HomeBloc>(context1).add(UpdateEvent( ))) ;
                },
                child: Text(
                  'Add List',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.blue),
                ),
              ))
        ],
      ),
    );
  }

}
