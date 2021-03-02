
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class indexbai2 extends StatefulWidget {
  @override
  _indexbai2State createState() => _indexbai2State();
}

class _indexbai2State extends State<indexbai2> {
  var _list=[
    {'name':'Web Development',
      'task':'4',
    'mess':'2'
    },
    {'name':'Design Team',
      'task':'0',
      'mess':'0'
    },
    {'name':'Business Development',
      'task':'0',
      'mess':'0'
    },
    {'name':'Funny',
      'task':'0',
      'mess':'12'
    },
    {'name':'Documantation',
      'task':'4',
      'mess':'2'
    },
    {'name':'Web Development',
      'task':'4',
      'mess':'2'
    },
    {'name':'Web Development',
      'task':'4',
      'mess':'2'
    }
    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          backgroundColor: Colors.black,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 72,
          decoration: BoxDecoration(
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Column(
                children: [
                  Icon(Icons.home_rounded,color: Colors.red,size: 30,),
                  Text('Workspaces',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 12),)
                ],
              ),
                Column(
                  children: [
                    Icon(Icons.table_chart_sharp,color: Colors.white38,size: 30,),
                    Text('Workspaces',style: TextStyle(color: Colors.white38,fontWeight: FontWeight.bold,fontSize: 12),)
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.calendar_today,color: Colors.white38,size: 30,),
                    Text('Workspaces',style: TextStyle(color: Colors.white38,fontWeight: FontWeight.bold,fontSize: 12),)
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.chat_bubble_outline,color: Colors.white38,size: 30,),
                    Text('Workspaces',style: TextStyle(color: Colors.white38,fontWeight: FontWeight.bold,fontSize: 12),)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          Container(
            width: 410,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.2,color: Colors.white30),shape: BoxShape.circle
                    ),
                    child: Icon(Icons.filter_list_outlined),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.2,color: Colors.white30),shape: BoxShape.circle
                    ),
                    child: Icon(Icons.add_alert),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Good Morning\nBatuhan,',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 35),),
            SizedBox(
              height: 20,
            ),
            Text('You have 4 unread messages and 6 to-do item waiting.',style: TextStyle(color: Colors.white30,fontSize: 16,fontWeight: FontWeight.w500),),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 505,
              width: double.infinity,
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context,index){
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      height: 90,
                      decoration: BoxDecoration(
                          color: Colors.white10,
                        borderRadius: BorderRadius.all(Radius.circular(2))
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 6,
                            height: 90,
                            decoration: BoxDecoration(
                                color: index%2==0? Colors.blue:index%3==0?Colors.green:Colors.teal,
                                borderRadius: BorderRadius.all(Radius.circular(2))
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('${_list[index]['name']}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16),),
                              SizedBox(
                                height: 4,
                              ),
                              Text('${_list[index]['task']} assigned task * ${_list[index]['mess']} messages',style: TextStyle(color: Colors.white30,fontSize: 14,fontWeight: FontWeight.w500))
                            ],
                          ),
                          SizedBox(
                            width: 90,
                          ),
                          Icon(Icons.arrow_forward,color: Colors.white,)
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
    );
  }
}
