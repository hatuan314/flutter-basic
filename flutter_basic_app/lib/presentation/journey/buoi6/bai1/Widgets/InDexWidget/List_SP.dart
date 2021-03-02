

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
Container listsp(BuildContext context){
return Container(
  height: 420,
child: GridView.count(

  childAspectRatio: (15/20),
    crossAxisCount: 2,
crossAxisSpacing: 10,
mainAxisSpacing: 10,
children: List.generate(100, (index){
  return GestureDetector(
    onTap: (){
      Navigator.pushNamed(context,RouteList.buoi6Bai1thongTin);
    },
    child: Container(
      color: Colors.transparent,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 165,
            height: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey
                  )
                ]
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Indian Salad',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                SizedBox(
                  height: 5,
                ),
                Text('Hot & Spicy',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.teal),),
                SizedBox(
                  height: 5,
                ),
                Text('đ14.80',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red,fontSize: 20),),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 110,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage('assets/img/doan1.jpg'),
                    fit: BoxFit.fill,
                  ),boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 7,
                      offset: Offset(0,9)
                    )
                ]
                ),
              )
          )
        ],
      ),
    ),
  );
}),
),
);
}