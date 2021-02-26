import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
    body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(padding: EdgeInsets.fromLTRB(60, 10,100, 0),
              child:Text(
                  'Hi Lautaro Nicolás!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 38,
                    decoration: TextDecoration.none,
                  ),
                ),
            ),
            Padding(padding: EdgeInsets.fromLTRB(10, 20,250, 0),
                child: Container(
                  color: Colors.white,
                  height: 3,
                  width: 80,
                ),),
            Padding(padding: EdgeInsets.fromLTRB(60, 40,80, 0),
              child:Text(
                'Mihajlo Tunev has invited you to be a player at Dribbble. As a player, you''ll be able to upload shots and post comments in addition to following the work of others.' ,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 18,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
      Padding(padding: EdgeInsets.fromLTRB(60, 40,80, 0),
           child: FlatButton(onPressed:(){},
               shape: Border.all(
                 color: Colors.white,
                 width: 2,
               ),

                child: Padding(padding: EdgeInsets.fromLTRB(35,20,35,20),
                    child:Text('Accept Invitation',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,

                            fontWeight: FontWeight.bold
                ),)
            )
      )
      )




          ],
        ),
      )

    );
  }
}
