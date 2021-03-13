import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/welcome_page/welcome_page/widgets/Contanner.dart';
import 'package:flutter_basic_app/presentation/journey/buoi6/bai1/Pages/welcome_page/welcome_page/widgets/MyClipper.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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

