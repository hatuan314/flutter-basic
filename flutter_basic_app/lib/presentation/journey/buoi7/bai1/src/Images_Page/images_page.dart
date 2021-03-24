import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai1/constrants/route_constantsbuoi7bai1.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai1/src/Images_Page/Gridview_Img.dart';
import 'package:flutter_screenutil/screen_util.dart';

class image_Page extends StatefulWidget {
  @override
  _image_PageState createState() => _image_PageState();
}

class _image_PageState extends State<image_Page>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
     length: 4,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: _appbar(),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: ScreenUtil().setHeight(60),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.black26))
              ),
              child: TabBar(
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black26,
                tabs: [

                  Tab(
                    icon: Icon(Icons.menu_outlined,size: ScreenUtil().setSp(30),),
                  ),
                  Tab(
                    icon: Icon(Icons.table_chart_sharp,size: ScreenUtil().setSp(30)),
                  ),
                  Tab(
                    icon: Icon(Icons.list_sharp,size: ScreenUtil().setSp(30)),
                  ),
                  Tab(
                    icon: Icon(Icons.addchart_outlined,size: ScreenUtil().setSp(30)),
                  ),
                ],
              ),
            ),
        Expanded(
          child: TabBarView(
       
            children: [
              // first tab bar view widget
              gridView(),

              // second tab bar view widget
              Center(
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Center(
                child: Text(
                  'Hello',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

        ),
      ]
        )
      ),
    );
  }

  Widget _appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Container(
        color: Colors.white,
        padding: EdgeInsets.all(ScreenUtil().setWidth(10)),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              decoration:
                  BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
              child: Center(
                child: Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Colors.white,
                  size: ScreenUtil().setSp(17),
                ),
              )),
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          Text(
            'Images',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: ScreenUtil().setWidth(20)),
          ),
          Text(
            '500 Items in Box',
            style: TextStyle(
                color: Colors.black26,
                fontWeight: FontWeight.w700,
                fontSize: ScreenUtil().setWidth(16)),
          ),
        ],
      ),
    );
  }
}
