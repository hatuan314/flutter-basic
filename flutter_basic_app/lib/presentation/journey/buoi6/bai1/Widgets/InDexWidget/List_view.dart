
import 'package:flutter/material.dart';
class listview extends StatefulWidget {
  @override
  _listviewState createState() => _listviewState();
}

class _listviewState extends State<listview> {
  int vitri=0;
  List list=[{
    'name':'Burger',
    'img':'assets/img/hamberger.png'
  },
    {
      'name':'Donat',
      'img':'assets/img/Dona.png'
    },
    {
      'name':'Pizza',
      'img':'assets/img/pizza.png'
    },
    {
      'name':'Mexican',
      'img':'assets/img/mesica.png'
    },{
      'name':'Mexican',
      'img':'assets/img/mesica.png'
    },{
      'name':'Mexican',
      'img':'assets/img/mesica.png'
    },{
      'name':'Mexican',
      'img':'assets/img/mesica.png'
    },{
      'name':'Mexican',
      'img':'assets/img/mesica.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      color: Colors.transparent,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: list.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
              vitri=index;
              setState(() {
              });
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15,bottom: 10),
                child: Container(
                  width: 74,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(70)),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: index==vitri? [Colors.deepPurple.withOpacity(0.3),Colors.deepPurpleAccent]:[Colors.white,Colors.white]
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            blurRadius: 3,
                            offset: Offset(0,5)
                        )
                      ]
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        padding: EdgeInsets.all(9),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(list[index]['img']),
                      ),
                      Text('${list[index]['name']}',style: TextStyle(color:index==vitri?Colors.white:Colors.black,fontWeight: FontWeight.w400),),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
            );
          }
      ),

    );
  }
}
