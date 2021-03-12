import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class B6Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.white10,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      leading: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.white,
          elevation: 0.0,
          child: Icon(
            Icons.waves,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Padding(
            padding: EdgeInsets.zero,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/images/1.jpg"),
            )),
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Zomo Food',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _body() {
    var _controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white10,
      body: Column(
        children: [
          Container(
            // height: ,
            padding: EdgeInsets.all(5.0),
            child: Stack(
              children: [
                TextField(
                  style: TextStyle(
                    // fontSize: 20
                  ),
                  decoration: InputDecoration(
                      isDense: true,
                    contentPadding: EdgeInsets.fromLTRB(15, 20, 110, 20),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 10,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: (RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Filter  ",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon(
                              Icons.ballot,
                              size: 18,
                            ),
                          ),
                        ],
                      ),
                    )),
                    onPressed: null,
                    disabledColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ), //Searchbar

          Container(
            height: 140,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                _itemWidget("hello","assets/images/1.jpg", null),
                _itemWidget("hi","assets/images/1.jpg",  null),
                _itemWidget("hello","assets/images/1.jpg", null),
                _itemWidget("hi","assets/images/1.jpg", null),
                _itemWidget("hello","assets/images/1.jpg", null),
                _itemWidget("hi","assets/images/1.jpg", null),
                _itemWidget("hello","assets/images/1.jpg", null),
                _itemWidget("hi","assets/images/1.jpg", null),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  Widget _itemWidget(String title, String photos, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(40)),
            border: Border.all(color: Colors.grey)),
        child: Column(
          children: [
          CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(photos),
        ),
            SizedBox(height: 15,),
            Text(title),
          ],
        ),
        ),

    );
  }

  Widget _bottomNavigationBar() {}
}
