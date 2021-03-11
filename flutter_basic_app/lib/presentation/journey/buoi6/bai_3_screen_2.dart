import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class B3Screen2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white70.withOpacity(0.97),
        appBar: _appBar(),
        body: _body(),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.all(20),
          child: _bottomNavigationBar(),
        ));
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
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      actions: [
        Padding( padding: EdgeInsets.only(right: 15),
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
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: [

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.all(10),
                  child: Card(
                    color: Colors.deepPurpleAccent.shade400,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child:Image.asset('assets/images/icon.png',width: 55,height: 20,),),),
                        Padding(
                          padding: EdgeInsets.only(left: 20, bottom: 10, top: 40),
                          child: Text(
                            'My Balance',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(bottom: 20, left: 20,),
                          child: Row(

                            children: [
                              Expanded(
                                flex: 8,
                                child: Text(
                                  '\$2388,70',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(1),
                                      fontSize: 17),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(
                                  'VISA',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white.withOpacity(1),
                                      fontSize: 17),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 30, bottom: 10),
                  child: Text(
                    'My Card',
                    style: TextStyle(
                        fontFamily: 'AR',
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  )),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  _listViewItem(Colors.indigo, 'Visa Gold', '***** 6666', '\$1500,50'),
                  _listViewItem(Colors.purpleAccent, 'Visa Virtual', '***** 1998', '\$222,20'),
                  _listViewItem(Colors.blue, 'Visa Mobile', '***** 2345', '\$660,00'),
                ],
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 10),
                  child: Text(
                    'Balance Information',
                    style: TextStyle(
                        fontFamily: 'AR',
                        color: Colors.black.withOpacity(0.5),
                        fontSize: 17,
                        fontWeight: FontWeight.w500),
                  )
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 90,
                child:ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      _listViewItem2('\$660.00',Icon(Icons.trending_up, size: 30,color: Colors.blue,),),
                      _listViewItem2('\$40.00', Icon(Icons.trending_down, size: 30,color: Colors.red),)
                    ]),)
            ],
          ),
        ]);
  }

  Widget _listViewItem(Color _backgroundColor, String title,String account, String balance) {
    return Container(
      margin: EdgeInsets.only(top: 10,right: 20,left: 20,bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex:2,
            child:
            Container(
              decoration: BoxDecoration(
              //color: _backgroundColor,
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment(0.0,0.97),

                  colors: [
                    _backgroundColor,
                    _backgroundColor.withOpacity(0.2)
                  ],
                ),
                borderRadius: BorderRadius.circular(5),),
              child: Padding(padding: EdgeInsets.fromLTRB(55, 5, 3, 32),
                child: Text('VISA',style: TextStyle(
                  color: Colors.white,
                  fontSize: 5,

                )
                  ,)
                ,),

            ),),
          Expanded(
              flex:4,
              child:
              Padding(padding: EdgeInsets.only(left: 10),child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 8),child:
                  Text('$title',style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),),),
                  Text('$account',style: TextStyle(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.4)
                  ),)
                ],
              ),)
          ),
          Expanded(
              flex:4,
              child: Align( alignment: Alignment.bottomRight,
                  child:RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text:'$balance  ',style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          )),
                          TextSpan(text:'USD',style:TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ), )
                        ]
                    ),
                  ))
          ),
        ],
      ),
    );
  }

  Widget _listViewItem2(String balance, Icon _icon)
  {
    return Container(
        margin: EdgeInsets.all(17),

        width: 160,
        decoration: BoxDecoration(

            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),
        child:Padding(padding: EdgeInsets.all(5),
          child: Row(
            children: [
              Padding(padding: EdgeInsets.all(5),
                child:
                _icon,),
              Padding(padding: EdgeInsets.all(5),
                  child:
                  RichText(
                    text: TextSpan(
                        children: [
                          TextSpan(text:'$balance  ',style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold
                          )),
                          TextSpan(text:'USD',style:TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                          ), )
                        ]
                    ),
                  )
              )   ],
          ),)
    );
  }
  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.deepPurple[100].withOpacity(0.8),
        iconSize: 30,
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
        ]);
  }
}
