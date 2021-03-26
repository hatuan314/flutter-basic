

import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _body(context));
  }

  Widget _body(BuildContext context) {
    // return ListView.builder(
    //     scrollDirection: Axis.vertical,
    //     itemCount: 20,
    //     itemBuilder: (context, index) {
    //   return Container(
    //     padding: EdgeInsets.all(20),
    //     margin: EdgeInsets.all(10),
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.all(Radius.circular(5)),
    //         border: Border.all(color: Colors.grey)),
    //     child: Text('$index'),
    //   );
    // });
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
        _itemWidget('Buổi 6 - Bai 1', () {
          Navigator.pushNamed(context, RouteList.b6Src1);
        }),
        _itemWidget('Buổi 6 - Bai 2', () {
          Navigator.pushNamed(context, RouteList.b6Src2);
        }),
        _itemWidget('Buổi 6 - Bai 3 Screen 1', () {
          Navigator.pushNamed(context, RouteList.b6Src3);
        }),
        _itemWidget('Buổi 6 - Bai 3 Screen 2', () {
          Navigator.pushNamed(context, RouteList.b6Src4);
        }),
        _itemWidget('Buổi 6 - Bai 3 Screen 3', () {
          Navigator.pushNamed(context, RouteList.b6Src5);
        }),
        _itemWidget('Buổi 7 - Gridview Example', () {
          Navigator.pushNamed(context, RouteList.b7Src1);
        }),
        _itemWidget('Buổi 7 - Bai 1 Screen 1', () {
          Navigator.pushNamed(context, RouteList.b7Src2);
        }),
        _itemWidget('Buổi 7 - Bai 1 Screen 2', () {
          Navigator.pushNamed(context, RouteList.b7Src3);
        }),
        _itemWidget('Buổi 7 - Bai 2', () {
          Navigator.pushNamed(context, RouteList.b7Src4);
        }),
        _itemWidget('Buổi 7 - Bai 3', () {
          Navigator.pushNamed(context, RouteList.b7Src5);
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
