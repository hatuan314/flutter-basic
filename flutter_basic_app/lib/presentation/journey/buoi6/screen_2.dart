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
      title:
        Row(
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
    return Scaffold(
      backgroundColor: Colors.white10,
      body:
      Column(
        children: [
          Padding(
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {}
}
