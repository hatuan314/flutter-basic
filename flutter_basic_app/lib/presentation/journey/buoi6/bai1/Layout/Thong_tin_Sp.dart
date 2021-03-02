import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Widgets/ThongTinWidget/App_Bar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Widgets/ThongTinWidget/Show_anh.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Widgets/ThongTinWidget/bottomAppBar.dart';

class thongTin extends StatefulWidget {
  @override
  _thongTinState createState() => _thongTinState();
}

class _thongTinState extends State<thongTin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomAppBar(),
      backgroundColor: Colors.white,
      appBar: appBarWidgetThongtin(context),
      body: showAnh(),
    );
  }
}
