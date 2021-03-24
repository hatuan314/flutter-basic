
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai3/list_sp/grid_view_SP.dart';
import 'package:flutter_screenutil/screen_util.dart';
class list_SP extends StatefulWidget {
  @override
  _list_SPState createState() => _list_SPState();
}

class _list_SPState extends State<list_SP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: grid_view_sp(),
    );
  }
  Widget _appBar(){
    return AppBar(
      backgroundColor: Colors.amber,
         elevation: 0,
         leading: BackButton(
           color: Colors.white,
         ),
      title: Text('New Arrivals',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: ScreenUtil().setSp(20)),),
      actions: [
        Icon(Icons.shopping_cart_rounded,size: ScreenUtil().setSp(30),),
        SizedBox(
          width: 20,
        ),
        Icon(Icons.keyboard_control_rounded,size: ScreenUtil().setSp(30)),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
