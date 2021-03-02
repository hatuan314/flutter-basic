import 'package:flutter/material.dart';
Padding container(){
  return Padding(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
    child: Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 5,
            offset: Offset(0,2)
          )
        ],
        borderRadius: BorderRadius.all(Radius.circular(70))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.youtube_searched_for_sharp,color: Colors.teal.withOpacity(0.5),size: 35,),
          Container(
            width: 200,
            color: Colors.white,
            child: TextField(
         decoration: InputDecoration(
           border: InputBorder.none,
           hintText: 'Search',
           hintStyle: TextStyle(color: Colors.teal.withOpacity(0.5))
         ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Container(
              width: 90,
             height: double.infinity,
             decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.pinkAccent.withOpacity(0.7),Colors.pink.withOpacity(0.9)]
              ),
               borderRadius: BorderRadius.all(Radius.circular(100))
             ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Filter',style: TextStyle(color: Colors.white,fontSize: 16),),
                  Icon(Icons.sort,color: Colors.white,)
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}