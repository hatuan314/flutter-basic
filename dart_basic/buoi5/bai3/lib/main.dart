import 'package:flutter/material.dart';
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Myappstf(),
    );
  }
}
class Myappstf extends StatefulWidget {
  @override
  _MyappstfState createState() => _MyappstfState();
}

class _MyappstfState extends State<Myappstf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 105, 0),
                child: Text("Welcome\nto dribble!",style: TextStyle(color: Colors.white,fontSize: 40),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 230, 0),
                child: Container(
                  height: 4,
                  width: 70,
                  color: Colors.white,
                ),
              ),
              Container(
                height: 40,
              ),
              Container(
                height: 150,
                width: 270,
                child: Flexible(
                    child: Text('we.re on a mission to build the world is best community for creatives to share,grow,anh get hired',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ),
              AnimatedContainer(
                height: 60,
                width: double.infinity,
             duration: Duration(seconds: 1),
             decoration: BoxDecoration(
               border: Border.all(color: Colors.white,width: 1)
             ),
                child: Center(child: Text('Accept Invitation',style: TextStyle(fontSize: 20,color: Colors.white),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

