

import 'package:flutter/material.dart';

  class Screm1 extends StatefulWidget {
    @override
    _Screm1State createState() => _Screm1State();
  }

  class _Screm1State extends State<Screm1> {
    @override
    Widget build(BuildContext context) {
      List _icon=[
        {'icon':Icons.account_circle_rounded,'name':'Profile setting'},
        {'icon':Icons.location_on_outlined,'name':'Postal address'},
        {'icon':Icons.trending_up,'name':'Transaction history'},
        {'icon':Icons.shopping_bag_outlined,'name':'Payments'},
        {'icon':Icons.chat_outlined,'name':'Chat and helps'},
        {'icon':Icons.phone_in_talk,'name':'Phone number'},
        {'icon':Icons.phone_in_talk,'name':'Profile setting'},
        {'icon':Icons.phone_in_talk,'name':'Profile setting'},
        {'icon':Icons.phone_in_talk,'name':'Profile setting'},
      ];
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          actions: [
            Center(
                child: Text('Profile',
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
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.3),
                    shape: BoxShape.circle),
                child: Image.asset(
                  'assets/img/conguoi.png',
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Toreto',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4,),
                Icon(
                  Icons.verified_sharp,
                  color: Colors.deepPurpleAccent,
                  size: 18,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Semarang Indonesia',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 11,
                  color: Colors.black45),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 572,
              width: double.infinity,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account Seting',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black45),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 540,
                      child: ListView.builder(
                          itemCount: _icon.length,
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(5, 35, 0, 0),
                              child: GestureDetector(
                                onTap: (){
                                  Navigator.pushNamed(context, '/history');
                              },
                                child: Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                          color: Colors.teal.withOpacity(0.1),
                                          borderRadius: BorderRadius.all(Radius.circular(17))
                                      ),
                                      child: Icon(_icon[index]['icon'],color: index==3?Colors.pinkAccent:index==4?Colors.red:Colors.blue,),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                   Container(
                                     width:295,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(_icon[index]['name'],style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black87),),
                                        Icon(Icons.arrow_forward_ios_sharp,size: 15,)
                                      ],
                                    ),
                                   )
                                  ],
                                ),
                              ),
                            );
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

