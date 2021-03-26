import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B3Screen2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70.withOpacity(0.97),
      body: Stack(
        fit: StackFit.loose,
        children: [
          Scaffold(
            appBar: _appBar(),
            body: _body(),
          ),
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
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      title: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'My Wallet',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(20),
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: ScreenUtil().setWidth(15)),
            child: Icon(
              Icons.keyboard_control_rounded,
              size: ScreenUtil().setSp(32),
              color: Colors.black,
            ))
      ],
    );
  }

  Widget _body() {
    return ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(ScreenUtil().setHeight(10)),
                  child: Card(
                    color: Colors.deepPurpleAccent.shade400,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                right: ScreenUtil().setWidth(10),
                                top: ScreenUtil().setHeight(10)),
                            child: Image.asset(
                              'assets/images/icon.png',
                              width: ScreenUtil().setWidth(55),
                              height: ScreenUtil().setHeight(20),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: ScreenUtil().setWidth(20),
                              bottom: ScreenUtil().setHeight(10),
                              top: ScreenUtil().setHeight(40)),
                          child: Text(
                            'My Balance',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5),
                                fontSize: ScreenUtil().setSp(15)),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: ScreenUtil().setHeight(20),
                            left: ScreenUtil().setWidth(20),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 8,
                                child: Text(
                                  '\$2388,70',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(1),
                                      fontSize: ScreenUtil().setWidth(17)),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'VISA',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(1),
                                      fontSize: ScreenUtil().setSp(17)),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20),
                      top: ScreenUtil().setHeight(30),
                      bottom: ScreenUtil().setHeight(10)),
                  child: Text(
                    'My Card',
                    style: TextStyle(
                        fontFamily: 'AR',
                        color: Colors.black.withOpacity(0.5),
                        fontSize: ScreenUtil().setSp(17),
                        fontWeight: FontWeight.w500),
                  )),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  _listViewItem(
                      Colors.indigo, 'Visa Gold', '***** 6666', '\$1500,50'),
                  _listViewItem(Colors.purpleAccent, 'Visa Virtual',
                      '***** 1998', '\$222,20'),
                  _listViewItem(
                      Colors.blue, 'Visa Mobile', '***** 2345', '\$660,00'),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: ScreenUtil().setWidth(20),
                      top: ScreenUtil().setHeight(20),
                      bottom: ScreenUtil().setHeight(10)),
                  child: Text(
                    'Balance Information',
                    style: TextStyle(
                        fontFamily: 'AR',
                        color: Colors.black.withOpacity(0.5),
                        fontSize: ScreenUtil().setWidth(17),
                        fontWeight: FontWeight.w500),
                  )),
              Container(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                height: ScreenUtil().setHeight(90),
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                 //     Padding(padding: EdgeInsets.only(left: ScreenUtil().setWidth(15),),child:
                      _listViewItem2(
                        '\$660.00',
                        Icon(
                          Icons.trending_up,
                          size: ScreenUtil().setSp(30),
                          color: Colors.blue,
                        ),),
  //  ),
                      _listViewItem2(
                        '\$40.00',
                        Icon(Icons.trending_down,
                            size: ScreenUtil().setSp(30), color: Colors.red),
                      ),

                    ]),
              )
            ],
          ),
        ]);
  }

  Widget _listViewItem(
      Color _backgroundColor, String title, String account, String balance) {
    return Container(
      margin: EdgeInsets.only(
          top: ScreenUtil().setHeight(10),
          right: ScreenUtil().setWidth(20),
          left: ScreenUtil().setWidth(20),
          bottom: ScreenUtil().setHeight(10)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                //color: _backgroundColor,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(0.0, 0.97),
                  colors: [_backgroundColor, _backgroundColor.withOpacity(0.2)],
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                    ScreenUtil().setWidth(55),
                    ScreenUtil().setHeight(5),
                    ScreenUtil().setWidth(3),
                    ScreenUtil().setHeight(32)),
                child: Text(
                  'VISA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ScreenUtil().setSp(5),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(left: ScreenUtil().setWidth(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(bottom: ScreenUtil().setHeight(8)),
                      child: Text(
                        '$title',
                        style: TextStyle(
                            fontSize: ScreenUtil().setSp(17),
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Text(
                      '$account',
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.black.withOpacity(0.4)),
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 4,
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                          text: '$balance  ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(15),
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'USD',
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.3),
                            fontSize: ScreenUtil().setSp(17),
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                  ))),
        ],
      ),
    );
  }

  Widget _listViewItem2(String balance, Icon _icon) {
    return Container(
        margin: EdgeInsets.all(ScreenUtil().setHeight(12)),
        width: ScreenUtil().screenWidth/2-35,
        height: 20,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
                child: _icon,
              ),
              Expanded(
                child: Padding(
                    padding: EdgeInsets.all(ScreenUtil().setHeight(5)),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: '$balance  ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(15),
                                fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: 'USD',
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: ScreenUtil().setSp(17)),
                        )
                      ]),
                    )),
              )
            ],
          ),
        ));
  }

  Widget _bottomNavigationBar() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)),
        width: (ScreenUtil().screenWidth),
        height: ScreenUtil().screenHeight / 14,
        child: Padding(
            padding: EdgeInsets.only(
              top: ScreenUtil().setHeight(5),
              bottom: ScreenUtil().setHeight(5),
              left: ScreenUtil().setWidth(27),
            ),
        child:Row(
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
                ),
            /*    Positioned(
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
                      color: Colors.blue,
                    ),
                  ),
                ),
           /*     Positioned(
                    left: ScreenUtil().setHeight(28),
                    bottom: ScreenUtil().setHeight(10),
                    child: Icon(
                      Icons.circle,
                      color: Colors.blue,
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
              ]
              ),
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
          ],
        )
        /*BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.deepPurple[100].withOpacity(0.8),
        iconSize: ScreenUtil().setSp(30),
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedFontSize: 0,
        selectedFontSize: 00,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: Icon(Icons.circle,size: 40,).toString(),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet_rounded,
            ), label: '',
            // ignore: deprecated_member_use
          ),
          //activeIcon: Icon(Icons.circle)),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ]
      )*/
        )
    );
  }
}
