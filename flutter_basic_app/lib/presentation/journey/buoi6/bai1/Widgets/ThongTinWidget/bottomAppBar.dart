import 'package:flutter/material.dart';
BottomAppBar bottomAppBar(){
  return BottomAppBar(
    child: Container(
      width: 200,
      height: 91,
      color: Colors.white,
      child: Center(
        child: Container(
          width: 280,
          height: 65,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(60)),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.blueAccent.withOpacity(0.5),Colors.deepPurple.withOpacity(0.8)]
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle
                ),
                child: Icon(Icons.work,color: Colors.red,),
              ),
              Text('Add to Cart',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 20),),
              Container(
                width: 60,
                child: Row(
                  children: [
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.white.withOpacity(0.25),),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.white.withOpacity(0.5)),
                    Icon(Icons.arrow_forward_ios,size: 20,color: Colors.white),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}