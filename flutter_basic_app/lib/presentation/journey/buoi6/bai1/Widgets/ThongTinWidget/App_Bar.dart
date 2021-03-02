
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
AppBar appBarWidgetThongtin(BuildContext context){
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.teal.withOpacity(0.08),
    automaticallyImplyLeading: false,
    title: Container(
      color: Colors.transparent,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap:(){
              Navigator.pushNamed(context, RouteList.buoi6Bai1index);
            } ,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      offset: Offset(0,3), // changes position of shadow
                    ),
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Icon(Icons.arrow_back_ios,color: Colors.black87,),
              ),
            ),
          ),
          Center(
              child:
              Text('Details',style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ),
              )
          ),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    offset: Offset(0,3), // changes position of shadow
                  ),
                ]
            ),
            child: Icon(Icons.share_outlined,color: Colors.black87,size: 30,),
          ),
        ],
      ),
    ),

  );
}