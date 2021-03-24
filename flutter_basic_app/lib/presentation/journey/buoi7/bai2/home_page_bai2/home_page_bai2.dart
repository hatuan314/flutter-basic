import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai2/home_page_bai2/Widgets/grid_View.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai2/home_page_bai2/Widgets/story.dart';
import 'package:flutter_screenutil/screen_util.dart';

class home_pagebai2 extends StatefulWidget {
  @override
  _home_pagebai2State createState() => _home_pagebai2State();
}

class _home_pagebai2State extends State<home_pagebai2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomAppBar(),
      appBar: _appbar(),
      body: Scaffold(
        backgroundColor: Colors.black87.withOpacity(0.8),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            children: [storyWidget(),
              SizedBox(
                height: ScreenUtil().setHeight(20),
              ),
              Expanded(child: gridViewbai2())],
          ),
        ),
      ),
    );
  }

  Widget _bottomAppBar() {
    return BottomAppBar(
      child: Container(
        height: 72,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(
                    Icons.home_rounded,
                    color: Colors.red,
                    size: 30,
                  ),
                  Text(
                    'Workspaces',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.table_chart_sharp,
                    color: Colors.white38,
                    size: 30,
                  ),
                  Text(
                    'Workspaces',
                    style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.white38,
                    size: 30,
                  ),
                  Text(
                    'Workspaces',
                    style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
              Column(
                children: [
                  Icon(
                    Icons.chat_bubble_outline,
                    color: Colors.white38,
                    size: 30,
                  ),
                  Text(
                    'Workspaces',
                    style: TextStyle(
                        color: Colors.white38,
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appbar() {
    return AppBar(
      backgroundColor: Colors.black87,
      elevation: 0,
      leading: Container(
        color: Colors.transparent,
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        child: Container(
          child: Icon(
            Icons.amp_stories,
            color: Colors.white,
            size: ScreenUtil().setSp(35),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        'Find Match',
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: ScreenUtil().setWidth(20)),
      ),
    );
  }
}
