import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_8/bai_1/number_of_items.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

Widget foodItem(BuildContext context) {
  // final item = Provider.of<ItemCounter>(context);
  return Stack(
    // fit: StackFit.expand,
    children: [
      Container(
        margin: EdgeInsets.all(0),
        height: ScreenUtil().screenWidth,
        width: ScreenUtil().screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.05),
                offset: Offset(0, 25),
                blurRadius: ScreenUtil().setHeight(10),
                spreadRadius: ScreenUtil().setSp(2),
              )
            ]),
        child: Container(
          margin: EdgeInsets.all(ScreenUtil().setWidth(50)),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.deepPurpleAccent.withOpacity(0.04),
                  offset: Offset(0, 00),
                  blurRadius: ScreenUtil().setHeight(0),
                  spreadRadius: ScreenUtil().setSp(25),
                )
              ]),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/noodle.jpg'),
          ),
          //child: Image.asset('assets/images/noodle.jpg',fit: BoxFit.fill,),
        ),
      ),
      Positioned(
        left: ScreenUtil().screenWidth * 2 / 3 - 30,
        top: ScreenUtil().setHeight(40),
        child: Container(
          key: Key('price'),
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(30),
              right: ScreenUtil().setWidth(30),
              top: ScreenUtil().setHeight(10),
              bottom: ScreenUtil().setHeight(10)),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Column(
            children: [
              Text(
                'Per Picez',
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(13),
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
              Text(
                '\$26.50',
                style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: ScreenUtil().setSp(25.5),
                    color: Colors.pinkAccent.withOpacity(0.7)),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        right: ScreenUtil().setWidth(ScreenUtil().screenWidth * 0.3),
        top: ScreenUtil().screenWidth - 50 + 10,
        child: Container(
            //  width: ScreenUtil(),
            padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(10),
                right: ScreenUtil().setWidth(10),
                top: ScreenUtil().setHeight(5),
                bottom: ScreenUtil().setHeight(5)),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.45),
                    offset: Offset(0, 10),
                    blurRadius: ScreenUtil().setHeight(10),
                  )
                ],
                gradient: LinearGradient(
                  end: FractionalOffset.topCenter,
                  begin: FractionalOffset.bottomCenter,
                  tileMode: TileMode.repeated,
                  colors: [
                    Colors.pinkAccent,
                    Colors.pinkAccent.withOpacity(0.6)
                  ],
                ),
                borderRadius: BorderRadius.circular(100)),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: ScreenUtil().setSp(37),
                  ),
                  onPressed: () => context.read<ItemCounter>().increment(),
                ),
                Container(
                  height: ScreenUtil().setWidth(40),
                  width: ScreenUtil().setWidth(40),
                  // padding: EdgeInsets.only(
                  //   top: (context.watch<ItemCounter>().count > 9)
                  //       ? ScreenUtil().setHeight(5.5)
                  //       : ScreenUtil().setHeight(4),
                  // ),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Text(
                      '${context.watch<ItemCounter>().count}',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ScreenUtil().setSp(30),
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: ScreenUtil().setSp(37),
                  ),
                  onPressed: () => ((context.read<ItemCounter>().count <= 0)
                      ? context.read<ItemCounter>().notchange()
                      : context.read<ItemCounter>().decrement()),
                ),
              ],
            )),
      )
    ],
  );
}
