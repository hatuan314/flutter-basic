import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class B3Screen1 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: _bottomNavigationBar(),
        ));
  }

  Widget _appBar() {
    return AppBar(
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      title: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Profile',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      actions: [
        Container(
            child: Icon(
              Icons.keyboard_control_rounded,
              size: 30,
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
            padding: EdgeInsets.only(top: 30),
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
                    padding: EdgeInsets.only(top: 10, bottom: 10, right: 5),
                    child: Text(
                      'Toreto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'AR',
                        fontSize: 23,
                        color: Colors.black,
                      ),
                    )),
                Icon(
                  Icons.check_circle,
                  size: 20,
                  color: Colors.indigoAccent,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              'Semarang, Indonesia',
              style:
              TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ]),
        Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
            child: Text(
              'Account Settings',
              style: TextStyle(
                  fontFamily: 'AR',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 20,
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
                  size: 30,
                  color: Colors.indigoAccent,
                )),
            _listViewItem(
                Colors.indigo[50],
                'Postal address',
                Icon(
                  Icons.location_on_outlined,
                  size: 30,
                  color: Colors.deepPurple[300],
                )),
            _listViewItem(
                Colors.purple[50],
                'Transaction history',
                Icon(
                  Icons.import_export,
                  size: 30,
                  color: Colors.purple[300],
                )),
            _listViewItem(
                Colors.pink[50],
                'Payment',
                Icon(
                  Icons.shopping_cart_outlined,
                  size: 30,
                  color: Colors.pink[300],
                )),
            _listViewItem(
                Colors.deepOrange[50],
                'Chat and helps',
                Icon(
                  Icons.message_outlined,
                  size: 30,
                  color: Colors.deepOrange[300],
                )),
          ],
        )
      ],
    );
  }

  Widget _listViewItem(Color _backgroundColor, String title, Icon _icon) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 15, 15, 10),
      //color: Colors.indigoAccent,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Container(
                    width: 50,
                    height: 55,
                    decoration: BoxDecoration(
                        color: _backgroundColor,
                        borderRadius: BorderRadius.circular(20)),
                    child: _icon,
                  ))),
          Expanded(
              flex: 6,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black.withOpacity(0.6)),
                ),
              )),
          Expanded(
              flex: 2,
              child: Icon(
                Icons.arrow_forward_ios_rounded,
                size: 20,
                color: Colors.black.withOpacity(0.4),
              ))
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.deepPurple[100].withOpacity(0.8),
        iconSize: 30,
        currentIndex: 3,
        selectedItemColor: Colors.blue,
        unselectedFontSize: 0,
        selectedFontSize: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_balance_wallet_rounded,
              ),
              label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ]);
  }
}
