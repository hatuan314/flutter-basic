import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Widgets/Wecome_Wideget//MyClipper.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Widgets/Wecome_Wideget/Contanner.dart';

class welcome extends StatefulWidget {
  @override
  _welcomeState createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    double witdh=MediaQuery.of(context).size.width;
    double height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          container(context,height),
          ClipPath(
            clipper: Myclipper(),
            child: Container(
              width: double.infinity,
              height: height-300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/daubep.png')
                  )
              ),
            ),
          ),
        ],
      )
    );
  }
}

