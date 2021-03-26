import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_7/example/ex_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewEx extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(ExConstants.title,
        textAlign: TextAlign.end,
        style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
        color: Colors.black,
          fontSize: ScreenUtil().setSp(32),
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(30),
          right: ScreenUtil().setWidth(30)
        ),
        child: GridView(
          shrinkWrap: true,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 7,
          mainAxisSpacing: 7),
          children: [
            gridViewItem('assets/images/ava.jpg'),
            gridViewItem('assets/images/ava.jpg'),
            gridViewItem('assets/images/ava.jpg'),
            gridViewItem('assets/images/ava.jpg'),
            gridViewItem('assets/images/ava.jpg'),
            gridViewItem_camera(),
            //gridViewItem('assets/images/ava.jpg'),
          ],
        ),
      ),
    );
  }

Widget gridViewItem(String imagePath){
    return Container(
      child: Image.asset(imagePath,),
    );
}
  Widget gridViewItem_camera(){
    return Container(
      color: Colors.grey,
      child: Container(
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        border: Border.all(
        color: Colors.white,
    width: ScreenUtil().setSp(2.5),
        ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: Icon(Icons.camera_alt, size: 35,color: Colors.white,),
        ),
      ),
    );
  }
}