import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_12/MyStream.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class B12MyHomePage extends StatefulWidget {
  @override
  _B12MyHomePageState createState() => _B12MyHomePageState();
}

class _B12MyHomePageState extends State<B12MyHomePage> {
 MyStream myStream = MyStream();

  @override
  void dispose() {
    myStream.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
            stream: myStream.counterStream,
             builder: (context,snapshot)=>Text(
snapshot.hasData?snapshot.data.toString():'0',
style: TextStyle(
fontSize: ScreenUtil().setSp(20),
color: Colors.black
),
)
)

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>myStream.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
