import 'package:flutter/material.dart';

class B5Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  text: 'BIKE',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: '.me',
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
            ),
            SizedBox(height: 20,),
            Text('Everyday bike!',
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.w300,))
          ],
        ),
      ),
    );
  }
}
