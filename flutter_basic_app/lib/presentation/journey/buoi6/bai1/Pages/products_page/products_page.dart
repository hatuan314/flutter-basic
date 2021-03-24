import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/products_page/widgets/App_Bar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/products_page/widgets/bottomAppBar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/products_page/widgets/Show_anh.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomAppBar(),
      backgroundColor: Colors.white,
      appBar: appBarWidgetThongtin(context),
      body: pictureWidget(),
    );
  }
}
