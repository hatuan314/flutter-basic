import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget deliveryAndCalories() {
  return GridView(

      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3.5,
        crossAxisSpacing: ScreenUtil().setWidth(20),
      ),
    children: [
      Padding(
        padding:  EdgeInsets.only(
              left: ScreenUtil().setWidth(40),),
        child: _gridViewItem ('assets/images/clock.png', '15-20 Min', 'Delivery'),
      ),
      Padding(
        padding: EdgeInsets.only(
          right: ScreenUtil().setWidth(40),),
        child: _gridViewItem ('assets/images/burningfire.png', '435 Kcal', 'Calories'),
      ),
    ],
  );
}

Widget _gridViewItem(String imagePath, String title, String subtitle) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.05),
          offset: Offset(0, 10),
          spreadRadius: ScreenUtil().setHeight(10),
          blurRadius: ScreenUtil().setHeight(10),
        )
      ],
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Row(
     mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Expanded(
        flex: 1,
          child: Container(
          //  padding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
              height: ScreenUtil().setWidth(50),
              width: ScreenUtil().setWidth(50),
          child:
          Image.asset(imagePath, fit: BoxFit.fill,)
          ),
        ),
        Expanded(
          flex:2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:   EdgeInsets.only(bottom:ScreenUtil().setWidth(3)),
                child: Text(title,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(15),
                ),
                ),
              ),
              Text(subtitle,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.3),
                  fontSize: ScreenUtil().setSp(12),
                ),)
            ],
          ),
        )
    ],
    ),
  );
}
