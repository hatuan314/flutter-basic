import 'package:flutter/material.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';
Container container(BuildContext context,double height){
  return Container(
    height: height,
    color: Colors.transparent,
    child: Padding(
      padding:  EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('   Order your\nDelicious Food',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 40,color: Colors.black87.withOpacity(0.75)
          ),
          ),
          SizedBox(
            height: 20,
          ),
          Text('Ask not what you can do for your country,\n                     Ask what for lunch',style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.teal.withOpacity(0.5)
          ),
          ),
          SizedBox(
            height: 25,
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/inDex');
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.pinkAccent.withOpacity(0.6),Colors.pink.withOpacity(0.9)],
                )
              ),
              child: Icon(Icons.arrow_forward,size: 45,color: Colors.white,),
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    ),
  );
}