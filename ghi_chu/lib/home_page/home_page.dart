
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/home_page/provider_home_page.dart';
import 'package:ghi_chu/home_page/widgets/edit_home_page.dart';
import 'package:ghi_chu/home_page/widgets/my_list_widget.dart';
import 'package:ghi_chu/home_page/widgets/search.dart';
import 'package:ghi_chu/home_page/widgets/wrap_widget.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:ghi_chu/schedule_page/provider_scheduled.dart';
import 'package:ghi_chu/to_day_page/provider_to_day.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(ScreenUtil().setWidth(15), 0,
            ScreenUtil().setWidth(15), ScreenUtil().setHeight(20)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () async {
                await Navigator.pushNamed(context, RouteList.newReminder)
                    .whenComplete(() {
                  context.read<ProviderHomePage>().setLeght();
                  for (int i = 0; i < ConstHomePage.list.length; i++) {
                    if (ConstHomePage.list[i]['title'] == 'To day') {
                      ConstHomePage.list[i]['sum'] = ProviderToday().getToday();
                    } else if (ConstHomePage.list[i]['title'] == 'Scheduled') {
                      ConstHomePage.list[i]['sum'] =
                        ProviderSchedule().getKey();
                    } else if (ConstHomePage.list[i]['title'] == 'All') {
                      ConstHomePage.list[i]['sum'] = Provider.of<ProviderHomePage>(context,listen: false).leghtAll;
                    }
                  }
                  setState(() {});
                });
              },
              child: Container(
                margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: ScreenUtil().setWidth(6),
                    ),
                    Text(
                      'New Reminder',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(17)),
                    )
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, RouteList.newList).then((value) {
                  context.read<ProviderHomePage>().update();
                });
              },
              child: Text(
                'Add List',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(18)),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: SizedBox(),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(10)),
            child: Center(
                child: GestureDetector(
                  onTap: (){
                    context.read<ProviderHomePage>().setedit();
                  },
                  child: Text(
              context.watch<ProviderHomePage>().edit?'Edit':'Done',
              style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setHeight(18)),
            ),
                )),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
              ScreenUtil().setWidth(20), 0, ScreenUtil().setWidth(20), 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              AnimatedContainer(
                duration: Duration(milliseconds: 200),
                margin: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
                width: ScreenUtil().screenWidth,
                height: context.watch<ProviderHomePage>().edit?ScreenUtil().setHeight(280):ScreenUtil().setHeight(220),
                color: Colors.transparent,
                child: Stack(
                  children: [
                    WrapWidget(),
                    EditWidget(),
                  ],
                )
              ),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Text(
                  'My Lists',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: ScreenUtil().setSp(20)),
                ),
              ),
            Column(
              children: List.generate(ModelListReminder.myList.length, (index){
                return MyListWiget(title: ModelListReminder.myList.keys.elementAt(index),color:ModelListReminder.myList['${ModelListReminder.myList.keys.elementAt(index)}'].color,);
              }),
            )
            ],
          ),
        ),
      ),
    );
  }
}
