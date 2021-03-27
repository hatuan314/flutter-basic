import 'package:flutter/material.dart';

class LearnGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2 ,
        childAspectRatio: 1.5,
        mainAxisSpacing: 5,
        crossAxisSpacing: 10,
        children: List.generate(50,(index){
          return Container(
            child: Card(
              color: Colors.blue,
            ),
          );
        }),
      ),
    );
  }
  
}