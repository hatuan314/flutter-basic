import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;


  @override
  Widget build(BuildContext context) {
   return Scaffold(
backgroundColor: Colors.red,
     appBar: AppBar(
       elevation: 0,
       backgroundColor: Colors.transparent,
       title: Padding(
         padding: const EdgeInsets.fromLTRB(360, 0, 0, 0),
         child: Text("X"),
       ),
     ),
     body: Padding(
       padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Text('Thanks for\njoining the Art X\nwating list!',style: TextStyle(
               color: Colors.white,fontSize: 30,
             fontWeight: FontWeight.bold
           ),),
           Padding(
             padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
             child: Container(
               width: 250,
               height: 100,
               child: Flexible(
                 child: Text('We will notify you via push notification as soon as registration is available or there is a change to your application status',style: TextStyle(color: Colors.tealAccent),),
               ),
             ),
           )
         ],
       ),
     ),
   );
  }
}
