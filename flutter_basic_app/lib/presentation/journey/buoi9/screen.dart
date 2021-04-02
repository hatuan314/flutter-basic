
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic_app/common/constants/route_constants.dart';

class CounterProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count {
    return _count;
  }

  double get price {
    return _count*26.50;
  }

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', count));
  }
}


class Count extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<CounterProvider>().count}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}


class Price extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
        '${context.watch<CounterProvider>().price}',
        key: const Key('counterState'),
        style: Theme.of(context).textTheme.headline4);
  }
}



class B9Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(context),
    );
  }

  Widget _appBar(BuildContext fello) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarHeight: 70,
      leading: (FloatingActionButton(
        heroTag: "hi",
        onPressed: () {
          Navigator.of(fello).pop();
        },
        backgroundColor: Colors.white,
        elevation: 1.0,
        child: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
      )),
      title: (Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Details",
            style: TextStyle(
              color: Colors.black,
            ),
          )
        ],
      )),
      actions: [
        FloatingActionButton(
          heroTag: "hello",
          onPressed: () {
            Navigator.pushNamed(fello, RouteList.b6Src2);
          },
          backgroundColor: Colors.white,
          elevation: 1.0,
          child: (Icon(
            Icons.share_rounded,
            color: Colors.black,
          )),
        )
      ],
    );
  }

  Widget _body(BuildContext context) {
    return Scaffold(
      body: (Column(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    width: 25,
                    color: Colors.white,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(25),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // border: Border.all(
                      //   color: Colors.black,
                      //   //width: 20,
                      // ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: (CircleAvatar(
                      // radius: MediaQuery.of(context). size. width - 145,
                      radius: 125,
                      backgroundImage: AssetImage("assets/images/1.jpg"),
                    )),
                  ),
                ),
              ),
              Positioned(
                  right: 25,
                  top: 10,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: (
                        Column(
                      children: [
                        Text(
                          "Per piece",
                          style: TextStyle(
                            fontFamily: "MS",
                            fontSize: 9,
                            color: Colors.grey,
                          ),
                        ),
                        Price(),
                        // Text(
                        //   "\$23.50",
                        //   style: TextStyle(
                        //     fontFamily: "MS",
                        //     fontSize: 30,
                        //     color: Colors.grey,
                        //   ),
                        // ),
                      ],
                    )),
                  )),
            ],
          ),
          Container(
            width: 225,
            height: 70,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(45),
            ),
            child: Row(
              children: [
                FlatButton(
                  onPressed: () => context.read<CounterProvider>().increment(),
                  color: Colors.transparent,
                  child: Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle),
                      child: Count(),

                  ),
                ),
                FlatButton(
                  onPressed: () => context.read<CounterProvider>().decrement(),
                  color: Colors.transparent,
                  child: Icon(
                    Icons.remove,
                    color: Colors.black,
                  ),
                ),
              ]
            )
          ),
          Container(),
        ],
      )),
    );
  }
}
