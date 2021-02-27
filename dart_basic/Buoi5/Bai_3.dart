import 'package:flutter/material.dart';


void main(){
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text('Bai 3 buoi 5'),
          ),
        body: Column(
          children: [
            Text('Hi Lautaro Nicolas'),
            Text(' Mihajlo tunev has invited you to be a player at dribble. '
                'as a player youll be able to upload shots and post comments '
                'in addition to following the work of others.'),
            Column(
              children: [
                FlatButton(
                  child: Text('Accept invitation'),
                  color: Colors.red,
                  onPressed: (){},
                )
              ],
            )
          ],
        ),
        ),
      ),
    );
  }

}