import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class B3Screen1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.97),
      appBar: _appBar(),
      body: Stack(
        fit: StackFit.loose,
        children: [
          _body(),
          Positioned(
              bottom: ScreenUtil().setHeight(10),
              left: ScreenUtil().setWidth(10),
              right: ScreenUtil().setWidth(10),
              child: _bottomNavigationBar())
        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      // shadowColor: Colors.white70.withOpacity(0.97),
      title: Text(
        'Profile',
        style: TextStyle(
            fontSize: ScreenUtil().setSp(20),
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
      actions: [
        Container(
            child: Icon(
          Icons.keyboard_control_rounded,
          size: ScreenUtil().setSp(30),
          color: Colors.black,
        ))
      ],
    );
  }

  Widget _body() {
    return ListView(
      children: [
        Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setHeight(30)),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/ava.jpg'),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(10),
                        bottom: ScreenUtil().setHeight(10),
                        right: ScreenUtil().setWidth(5)),
                    child: Text(
                      'Toreto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'AR',
                        fontSize: ScreenUtil().setSp(23),
                        color: Colors.black,
                      ),
                    )),
                Icon(
                  Icons.check_circle,
                  size: ScreenUtil().setSp(20),
                  color: Colors.indigoAccent,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: ScreenUtil().setHeight(10)),
            child: Text(
              'Semarang, Indonesia',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(15),
                  color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ]),
        Padding(
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(20),
                top: ScreenUtil().setHeight(10),
                bottom: ScreenUtil().setHeight(20)),
            child: Text(
              'Account Settings',
              style: TextStyle(
                  fontFamily: 'AR',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: ScreenUtil().setSp(20),
                  fontWeight: FontWeight.w500),
            )),
        ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            _listViewItem(
                Colors.indigo[50],
                'Profile Setting',
                Icon(
                  Icons.person_outline_rounded,
                  size: ScreenUtil().setSp(30),
                  color: Colors.indigoAccent,
                )),
            _listViewItem(
                Colors.indigo[50],
                'Postal address',
                Icon(
                  Icons.location_on_outlined,
                  size: ScreenUtil().setSp(30),
                  color: Colors.deepPurple[300],
                )),
            _listViewItem(
                Colors.purple[50],
                'Transaction history',
                Icon(
                  Icons.import_export,
                  size: ScreenUtil().setSp(30),
                  color: Colors.purple[300],
                )),
            _listViewItem(
                Colors.pink[50],
                'Payment',
                Icon(
                  Icons.shopping_cart_outlined,
                  size: ScreenUtil().setSp(30),
                  color: Colors.pink[300],
                )),
            _listViewItem(
                Colors.deepOrange[50],
                'Chat and helps',
                Icon(
                  Icons.message_outlined,
                  size: ScreenUtil().setSp(30),
                  color: Colors.deepOrange[300],
                )),
          ],
        )
      ],
    );
  }

  Widget _listViewItem(Color _backgroundColor, String title, Icon _icon) {
    return Container(
      margin: EdgeInsets.fromLTRB(
          ScreenUtil().setWidth(10),
          ScreenUtil().setHeight(15),
          ScreenUtil().setWidth(15),
          ScreenUtil().setHeight(10)),
      //color: Colors.indigoAccent,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.only(left: ScreenUtil().setWidth(20)),
                  child: Container(
                    width: ScreenUtil().setWidth(50),
                    height: ScreenUtil().setWidth(50),
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                        color: _backgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: _icon,
                  ))),
          Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(17),
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6)),
                ),
              )),
          Expanded(
              flex: 2,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: ScreenUtil().setSp(20),
                color: Colors.black.withOpacity(0.4),
              ))
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        width: (ScreenUtil().screenWidth),
        height: ScreenUtil().screenHeight / 14,
        child: Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(5),
              bottom: ScreenUtil().setHeight(5),
              left: ScreenUtil().setWidth(27),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Stack(children: [
                    Positioned(
                      top: ScreenUtil().setHeight(0),
                      child: IconButton(
                        icon: Icon(
                          Icons.home,
                          size: ScreenUtil().setSp(30),
                          color: Colors.deepPurple[100].withOpacity(0.8),
                        ),
                      ),
                    ),/*
                    Positioned(
                        left: ScreenUtil().setHeight(28),
                        bottom: ScreenUtil().setHeight(10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.transparent,
                          size: ScreenUtil().setSp(5),
                        ))*/
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(children: [
                    Positioned(
                      top: ScreenUtil().setHeight(0),
                      child: IconButton(
                        icon: Icon(
                          Icons.account_balance_wallet_rounded,
                          size: ScreenUtil().setSp(30),
                          color: Colors.deepPurple[100].withOpacity(0.8),
                        ),
                      ),
                    ),
                   /* Positioned(
                        left: ScreenUtil().setHeight(28),
                        bottom: ScreenUtil().setHeight(10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.transparent,
                          size: ScreenUtil().setSp(5),
                        ))*/
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(children: [
                    Positioned(
                      top: ScreenUtil().setHeight(0),
                      child: IconButton(
                        icon: Icon(
                          Icons.bar_chart,
                          size: ScreenUtil().setSp(30),
                          color: Colors.deepPurple[100].withOpacity(0.8),
                        ),
                      ),
                    ),
                  /*  Positioned(
                        left: ScreenUtil().setHeight(28),
                        bottom: ScreenUtil().setHeight(10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.transparent,
                          size: ScreenUtil().setSp(5),
                        ))*/
                  ]),
                ),
                Expanded(
                  flex: 1,
                  child: Stack(children: [
                    Positioned(
                      top: ScreenUtil().setHeight(0),
                      child: IconButton(
                        icon: Icon(
                          Icons.person,
                          size: ScreenUtil().setSp(30),
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  /*  Positioned(
                        left: ScreenUtil().setHeight(28),
                        bottom: ScreenUtil().setHeight(10),
                        child: Icon(
                          Icons.circle,
                          color: Colors.blue,
                          size: ScreenUtil().setSp(5),
                        ))*/
                  ]
                  ),
                ),
              ],
            )
        )
    );
  }
}
