
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class scremm2 extends StatefulWidget {
  @override
  _scremm2State createState() => _scremm2State();
}

class _scremm2State extends State<scremm2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          Center(
              child: Text('My Wallet',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.75),
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              )),
          SizedBox(
            width: 130,
          ),
          Text(
            '...',
            style: TextStyle(color: Colors.black, fontSize: 35),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 126,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.deepPurple,Colors.deepPurpleAccent]
                ),
                image: DecorationImage(
                  image: AssetImage('assets/img/hedear.png'),
                  fit: BoxFit.fitWidth
                )
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text('My Card',style: TextStyle(color: Colors.black45,fontWeight: FontWeight.w700,fontSize: 15),),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 85,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                      image: AssetImage('assets/img/visagold.png'),
                      fit: BoxFit.fill
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.deepPurple.withOpacity(0.7),
                        offset: Offset(0,7),
                        spreadRadius: -4
                      )
                    ]
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Visa Gold',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 8,
                    ),
                    Text('**** 6666',style: TextStyle(color: Colors.black26,fontWeight: FontWeight.w600,fontSize: 12),),
                  ],
                ),
                SizedBox(
                  width: 85,
                ),
                Text('đ15000,50 ',style: TextStyle(fontWeight: FontWeight.w600),),
                Text('USD',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black38),)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 85,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage('assets/img/visav.png'),
                          fit: BoxFit.fill
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.7),
                            offset: Offset(0,7),
                            spreadRadius: -4
                        )
                      ]
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Visa Virtual',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 8,
                    ),
                    Text('**** 1998',style: TextStyle(color: Colors.black26,fontWeight: FontWeight.w600,fontSize: 12),),
                  ],
                ),
                SizedBox(
                  width: 85,
                ),
                Text('đ222,20 ',style: TextStyle(fontWeight: FontWeight.w600),),
                Text('USD',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black38),)
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  height: 50,
                  width: 85,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: AssetImage('assets/img/visam.png'),
                          fit: BoxFit.fill
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.deepPurple.withOpacity(0.7),
                            offset: Offset(0,7),
                            spreadRadius: -4
                        )
                      ]
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Visa Mobile',style: TextStyle(fontWeight: FontWeight.bold),),
                    SizedBox(
                      height: 8,
                    ),
                    Text('**** 2345',style: TextStyle(color: Colors.black26,fontWeight: FontWeight.w600,fontSize: 12),),
                  ],
                ),
                SizedBox(
                  width: 85,
                ),
                Text('đ660,00 ',style: TextStyle(fontWeight: FontWeight.w600),),
                Text('USD',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black38),)
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Text('Balance Information',style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black45),),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/img/tang.png'),
                      Text('đ660,00',style: TextStyle(fontWeight: FontWeight.w600),),
                      Text('USD',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black26),)
                    ],
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  width: 160,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset('assets/img/giam.png'),
                      Text('đ40,50',style: TextStyle(fontWeight: FontWeight.w600),),
                      Text('USD',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black26),)
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
