import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class B3Screen3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: _body(),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      shadowColor: Colors.white,
      leading: Icon(
        Icons.arrow_back,
        size: 25,
        color: Colors.black.withOpacity(0.7),
      ),
      title: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'Transaction History',
          style: TextStyle(
              fontSize: 17,
              fontFamily: 'AR',
              fontWeight: FontWeight.w600,
              color: Colors.black),
        ),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.keyboard_control_rounded,
              size: 32,
              color: Colors.black,
            ))
      ],
    );
  }

  Widget _body() {
    return ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: EdgeInsets.all(30),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple[50].withOpacity(0.5)),
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.deepPurpleAccent),
                        indicatorColor: Colors.white,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.deepPurpleAccent,
                        tabs: [
                          Tab(
                              child: Text(
                            'All',
                            style: TextStyle(
                              fontFamily: 'AR',
                              fontSize: 15,
                            ),
                          )),
                          Tab(
                              child: Text(
                            'Income',
                            style: TextStyle(
                              fontFamily: 'AR',
                              fontSize: 15,
                            ),
                          )),
                          Tab(
                              child: Text(
                            'Outcome',
                            style: TextStyle(
                              fontFamily: 'AR',
                              fontSize: 15,
                            ),
                          )),
                        ],
                      ),
                    )),
              ),
              Padding(
                padding: EdgeInsets.only(top: 40,left: 15,bottom: 15),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 3.2,
                      child: Text(
                        'Yesterday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'AR',
                            color: Colors.grey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '24 Feb, 2021',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'AR',
                            color: Colors.grey.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  _listViewItem(Image.asset('assets/images/iconYoutube.png'), 'Youtube Pro', 'Yesterday, 04:15 pm',20),
                  _listViewItem(Image.asset('assets/images/iconYoutube.png'), 'From Malik Umimanyu', 'Yesterday, 01:15 pm',64),
                  _listViewItem(Image.asset('assets/images/iconSpotify.png'), 'Spotify Premium', 'Yesterday, 12:15 pm',16),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20,left: 15,bottom: 15),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      widthFactor: 3.8,
                      child: Text(
                        'Tuesday',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'AR',
                            color: Colors.grey),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '23 Feb, 2021',
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            fontFamily: 'AR',
                            color: Colors.grey.withOpacity(0.7)),
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  _listViewItem(Image.asset('assets/images/iconYoutube.png'), 'Figma Pro', 'Tuesday, 10:00 pm',-130),
                  _listViewItem(Image.asset('assets/images/iconYoutube.png'), 'Pro Create Premium', 'Tuesday, 10:00 am',-14),
                  _listViewItem(Image.asset('assets/images/icon3.png'), 'Dribbble Pro', 'Tuesday, 10:00 am',-230),
                  _listViewItem(Image.asset('assets/images/iconYoutube.png'), 'From Fiver', 'Tuesday, 10:00 am',2000),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _listViewItem(
      Image _leading, String title, String subtitle, int moneyDetail) {
    return ListTile(
      minVerticalPadding: 5,
      minLeadingWidth: 55,
      leading: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.teal.withOpacity(0.05),
        ),
        padding: EdgeInsets.all(10),
        child: _leading,
      ),
      title: Text(
        '$title',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontFamily: '',
          fontSize: 14,
          color: Colors.black
        ),
      ),
      subtitle: Text(
        '$subtitle',
        style: TextStyle(
            //fontWeight: FontWeight.bold,
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.grey
        ),
      ),
      trailing: Text(
          (moneyDetail<0)?'-\$${moneyDetail*-1}':'+\$$moneyDetail',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            fontFamily: 'Roboto',
            color: (moneyDetail<0)?Colors.deepOrange:Colors.teal.withOpacity(0.6)
        ),
      ),

    );
  }
}
