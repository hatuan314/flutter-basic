import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Bai2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0x000022),
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(10),
          child: _bottomNavigationBar(),
        ));
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Color(0x000022),
      leading: Container(
        width: 55,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(100)),
          border: Border.all(
            color: Colors.grey.withOpacity(0.4),
            width: 2.5,
          ),
        ),
        child: IconButton(
          icon: Icon(
            Icons.menu,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
      actions: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 2.5,
                  )
                  // border: Border(
                  //   top: BorderSide(
                  //       width: 2.5, color: Colors.grey.withOpacity(0.4)),
                  //   bottom: BorderSide(
                  //       width: 2.5, color: Colors.grey.withOpacity(0.4)),
                  //   left: BorderSide(
                  //       width: 2.5, color: Colors.grey.withOpacity(0.4)),
                  //   right: BorderSide(
                  //       width: 2.5, color: Colors.grey.withOpacity(0.4)),
                  // ),
                  ),
              child: IconButton(
                //padding: EdgeInsets.all(10),
                icon: Icon(
                  Icons.notifications_rounded,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(4),
                child: Text(
                  '14',
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.pinkAccent),
            ),
          ],
        )
      ],
    );
  }

  Widget _body() {
    return ListView(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: Text(
            'Good Morning Batuhan,',
            style: TextStyle(
                fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, right: 20),
          child: Text(
            'You\'ve 4 unread messages anh 6 to-do item waiting',
            style: TextStyle(
                fontSize: 20,
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(top: 25, right: 20),
            child: ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              children: [
                _itemWidget('Web Development', 4, 2, Colors.blue),
                _itemWidget('Design Team', 0, 0, Colors.orange),
                _itemWidget('Business Development', 0, 0, Colors.greenAccent),
                _itemWidget2('Funny', 12, Colors.purpleAccent),
                //_itemWidget2('Funny', 12, Colors.purpleAccent),
              ],
            ))
      ],
    );
  }

  Widget _itemWidget(String tittle, int task, int msg, Color _color) {
    return Container(
        color: Color.fromRGBO(27, 57, 93, 0.4),
        margin: EdgeInsets.all(5),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 80,
              decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(2),
                    bottomLeft: Radius.circular(2),
                  )),
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      tittle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.only(bottom: 20, left: 10),
                      child: Row(
                        children: [
                          Text(
                            '$task assigned ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 15),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          Text(
                            ' $msg messages',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 15),
                          ),
                        ],
                      ))
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ));
  }

  Widget _itemWidget2(String tittle, int msg, Color _color) {
    return Container(
        color: Color.fromRGBO(27, 57, 93, 0.4),
        margin: EdgeInsets.all(5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 8,
              height: 80,
              color: _color,
            ),
            Expanded(
              flex: 7,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      tittle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 5),
                    child: Text(
                      ' $msg messages',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 2,
                child: Icon(
                  Icons.arrow_forward_outlined,
                  color: Colors.white,
                  size: 30,
                ))
          ],
        ));
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle:
          TextStyle(color: Colors.pink.shade400, fontWeight: FontWeight.bold),
      selectedItemColor: Colors.pink.shade400,
      unselectedItemColor: Colors.white.withOpacity(0.5),
      unselectedLabelStyle:
          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      backgroundColor: Colors.black,
      iconSize: 27,
      unselectedFontSize: 14,
      selectedFontSize: 14,
      items: [
        BottomNavigationBarItem(
          //backgroundColor: Colors.black,
          label: 'Workspaces',
          icon: Icon(Icons.home_filled),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.view_quilt_rounded), label: 'Tasks'),
        BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined), label: 'Calendar'),
        BottomNavigationBarItem(
            icon: Icon(Icons.mark_chat_unread_outlined), label: 'Chat')
      ],
    );
  }
}
