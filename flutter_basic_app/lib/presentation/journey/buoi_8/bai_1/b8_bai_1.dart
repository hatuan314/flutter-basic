import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_8/bai_1/widget/b1_appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/add_to_cart_button.dart';
import 'widget/delivery_calories.dart';
import 'widget/food_info.dart';
import 'widget/food_item.dart';

class B8Bai1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   // log(0);
     return Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
            shrinkWrap: true,
            children:[
              B1appbar(),
              SizedBox(
              height: ScreenUtil().screenWidth+35,
              child: foodItem(context)),
            foodInfo(),
            Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setWidth(20),
              bottom: ScreenUtil().setWidth(20)),
              child: deliveryAndCalories(),
            ),
             addToCartButton(),
            ]
        ),
     );
  }

}