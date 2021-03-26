import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_7/bai_1/widgets/appbar.dart';
import 'package:flutter_screenutil/screen_util.dart';

class B1Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Bai1AppBar.B1appbar(
          Icon(
            Icons.arrow_back_ios_rounded,
            size: ScreenUtil().setSp(20),
          ),
          'Images',
          '500 Items In Box',
          Icon(
            Icons.more_vert,
            size: ScreenUtil().setSp(20),
          )),
      body: Stack(alignment: Alignment.center, children: [
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: ScreenUtil().setHeight(10)),
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade50,
                  spreadRadius: ScreenUtil().setHeight(0.5),
                  blurRadius: ScreenUtil().setHeight(1),
                  offset: Offset(0, -5),
                ),
              ]),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                iconSize: ScreenUtil().setSp(30),
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: 0,
                selectedItemColor: Colors.blueAccent,
                unselectedItemColor: Colors.grey,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      label: '',
                      icon: Icon(Icons.apps)),
                  BottomNavigationBarItem(
                      label: '',
                      icon: Icon(Icons.view_quilt,)),
                  BottomNavigationBarItem(
                      label: '',
                      icon: Icon(Icons.format_list_bulleted_rounded)),
                  BottomNavigationBarItem(
                      label: '', icon: Icon(Icons.check_box_outlined)),
                ],
              ),
            ),
            Expanded(
              flex: 5,
                child: GridView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: ScreenUtil().setWidth(5),
                    mainAxisSpacing: ScreenUtil().setHeight(5),
                  ),
                  children: [

                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),
                    gridViewItem('assets/images/ava.jpg'),],
                ),
              ),

          ],
        ),
        Positioned(
          //  left: ScreenUtil().screenWidth/2-20,
          bottom: ScreenUtil().setHeight(30),
          child: Container(
            child: FloatingActionButton(
              isExtended: true,
              backgroundColor: Colors.indigo.shade900.withOpacity(0.9),
              child: Icon(
                Icons.add,
                size: ScreenUtil().setSp(40),
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Widget gridViewItem(String imagePath) {
    return Container(
      child: Image.asset(imagePath,fit: BoxFit.fitHeight,),
    );
  }
}
