import 'package:flutter/material.dart';
dynamic bottomAppbar(){
  return Positioned(
    bottom: 0,
    child: Container(
      height: 80,
color: Colors.white,
      child: Row(
        children: [
          Container(
            width: 150,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.home_sharp,color: Colors.blue,size: 30),
                Icon(Icons.where_to_vote_sharp,color: Colors.teal.withOpacity(0.7),size: 30,),
              ],
            ),
          ),
          Container(
            width: 100,
            color: Colors.transparent,
          ),
          Container(
            width: 150,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.web_outlined,color: Colors.blue,size: 30),
                Icon(Icons.ac_unit,color: Colors.teal.withOpacity(0.7),size: 30,),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}