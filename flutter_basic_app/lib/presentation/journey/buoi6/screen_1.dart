import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class B6Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        backgroundColor: Colors.pinkAccent,
        tooltip: 'Increment',
        child: Icon(Icons.arrow_forward_outlined),
      ),
    );
  }


  Widget text_generator(String s, String fontfamily, FontWeight Weight, double size, Color color) {
    return Text(
      '${s}',
      style: TextStyle(
      color: color,
      fontFamily: 'MS',
      fontSize: size,
      fontWeight: Weight,
    ),
    );
  }


  Widget _body() {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/northernlights8.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: null,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 300, 0, 0),
          child:
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.elliptical(450.0, 225.0),
                  topRight: Radius.elliptical(450.0, 225.0),
                ),
                color: Colors.white,
                //borderRadius: BorderRadius,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                    ),
                    text_generator("Order Your", "MS", FontWeight.w700, 35, Colors.indigo),
                    text_generator("Delicious Food", "MS", FontWeight.w700, 35, Colors.indigo),
                    Padding(padding: EdgeInsets.fromLTRB(0,20,0,0)),
                    text_generator("Ask not what you can do for your country,", "MS", FontWeight.w400, null, null),
                    text_generator("Ask what for lunch is.", "MS", FontWeight.w400, null, null),
                  ],

              ),
            ),
        )
      ],
    );
  }
}
