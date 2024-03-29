import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(BuildContext context) {
    return ListView(
      children: [
        _itemWidget('Home Screen', () {
          Navigator.pushNamed(context, RouteList.homeScreen);
        }),
        _itemWidget('Buổi 5 - Screen 1', () {
          Navigator.pushNamed(context, RouteList.b5Src1);
        }),
        _itemWidget('Buổi 5 - Screen 2', () {
          Navigator.pushNamed(context, RouteList.b5Src2);
        }),
      ],
    );
  }

  Widget _itemWidget(String title, Function onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Colors.grey)),
        child: Text(title),
      ),
    );
  }
}
