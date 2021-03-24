import 'package:flutter/material.dart';
AppBar appBarWidget(){
  return AppBar(
    elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
    title: Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
            child: Icon(Icons.list,color: Colors.black87,),
          ),
          Center(
              child:
              Text('Zomo Food',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                fontSize: 25,
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
            child: Icon(Icons.account_circle_sharp,color: Colors.black87,),
          ),
        ],
      ),
    ),

  );
}