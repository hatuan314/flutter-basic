import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_7/bai_1/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class B7Bai2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: _appBar(),
        body:
            /*ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [*/
            Column(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.only(

                  top: ScreenUtil().setHeight(8),
                bottom: ScreenUtil().setHeight(18)),
                child:storyList(),
            ),
            ),
            Expanded(
              flex: 10,
              child: infoList(),
            ),
          ],
        ),
        bottomNavigationBar: _bottomNavigationBar(),
        //    ],
        //    )
        );
  }

  Widget _appBar() {
    return AppBar(
      backgroundColor: Colors.black.withOpacity(0.5),
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(
          left: ScreenUtil().setWidth(10),
          top: ScreenUtil().setHeight(5),
          bottom: ScreenUtil().setHeight(5),
        ),
        child: Icon(
          Icons.view_carousel_sharp,
          size: 30,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Find Match',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(17),
          fontFamily: 'AR',
          // fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(
            right: ScreenUtil().setWidth(10),
            top: ScreenUtil().setHeight(5),
            bottom: ScreenUtil().setHeight(5),
          ),
          child: Icon(Icons.menu_outlined),
        ),
      ],
    );
  }

  Widget storyList() {
    return ListView(
      padding: EdgeInsets.only(
        left: ScreenUtil().setWidth(10),
      ),
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: [
        Padding(
          padding: EdgeInsets.only(
            right: ScreenUtil().setWidth(15),
          ),
          child: Stack(
              children:[ storyItem('assets/images/1.jpg'),
          ]
          )
        ),
        Padding(
          padding: EdgeInsets.only(
            right: ScreenUtil().setWidth(15),
          ),
          child: Stack(
            children:[
    storyItem('assets/images/1.jpg'),
              Positioned(
                bottom: ScreenUtil().setHeight(5),
                  left: ScreenUtil().setWidth(21/2),
                  child:  Container(
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child:
                  Padding(
                    padding: EdgeInsets.only(
                      top:ScreenUtil().setHeight(1),
                      bottom: ScreenUtil().setHeight(1),
                      left: ScreenUtil().setWidth(8),
                      right: ScreenUtil().setWidth(8),),
                    child:Text(
                      'Hot',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ScreenUtil().setSp(10),
                      ),
                    ),
                  )
              )
              )
    ],
    ),
        ),

        Padding(
            padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(15),
            ),
            child: Stack(
                children:[ storyItem('assets/images/1.jpg'),
                ]
            )
        ),


        Padding(
            padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(15),
            ),
            child: Stack(
                children:[ storyItem('assets/images/1.jpg'),
                ]
            )
        ),


        Padding(
            padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(15),
            ),
            child: Stack(
                children:[ storyItem('assets/images/1.jpg'),
                ]
            )
        ),


        Padding(
            padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(15),
            ),
            child: Stack(
                children:[ storyItem('assets/images/1.jpg'),
                ]
            )
        ),


        Padding(
            padding: EdgeInsets.only(
              right: ScreenUtil().setWidth(15),
            ),
            child: Stack(
                children:[ storyItem('assets/images/1.jpg'),
                ]
            )
        ),
      ],
    );
  }

  Widget storyItem(String imagePath) {
    return DottedBorder(
        dashPattern: [1, 2],
        borderType: BorderType.Circle,
        padding: EdgeInsets.all(ScreenUtil().setWidth(5)),
        color: Colors.orange,
        child:
            CircleAvatar(radius: ScreenUtil().setWidth(21),  backgroundImage: AssetImage(imagePath)));
  }

  Widget infoList()
  {
    return GridView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: ScreenUtil().setWidth(10),
            mainAxisSpacing: ScreenUtil().setHeight(10),
        ),
        children: [
          infoItem('assets/images/1.jpg','Isaac McCarthy','Versatile',Colors.pinkAccent),
          infoItem('assets/images/1.jpg','Fred Maxwell','Top',Colors.teal.shade300),
          infoItem('assets/images/1.jpg','Wayne Poole','Bottom',Colors.purple.shade300),
          infoItem('assets/images/1.jpg','Tom Fuller','Vers-Top',Colors.lightGreen),
          infoItem('assets/images/1.jpg','Isaac McCarthy','Versatile',Colors.pinkAccent),
          infoItem('assets/images/1.jpg','Isaac McCarthy','Versatile',Colors.pinkAccent),
          infoItem('assets/images/1.jpg','Isaac McCarthy','Versatile',Colors.pinkAccent),
          ]
    );
  }
  Widget infoItem(String imagePath, String name, String detail, Color colorDetail)
  {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        image: DecorationImage(
          image:AssetImage(imagePath),
          fit: BoxFit.fitHeight,
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left:ScreenUtil().setWidth(10),
          bottom:ScreenUtil().setHeight(10),
        ),

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [

          Text(name, style: TextStyle(
            color: Colors.white,
            fontSize: ScreenUtil().setSp(15),
          ),
          ),


          Container(
            decoration: BoxDecoration(
            color: colorDetail,
              borderRadius: BorderRadius.circular(20)
            ),
            child:
            Padding(
              padding: EdgeInsets.only(
                top:ScreenUtil().setHeight(2),
              bottom: ScreenUtil().setHeight(2),
              left: ScreenUtil().setWidth(5),
               right: ScreenUtil().setWidth(5),),
              child:Text(
              detail,
              style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(10),
              ),
            ),
          )
        )
        ],
      ),
      )
    );
  }
  Widget _bottomNavigationBar(){
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: TextStyle(fontSize: ScreenUtil().setSp(11)),
      selectedLabelStyle: TextStyle(fontSize: ScreenUtil().setSp(11)),
      iconSize: ScreenUtil().setSp(27),
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label:'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.textsms_outlined),
          label:'Messages',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications_sharp),
          label:'Notification',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin_outlined),
          label:'Profiles',
        ),
      ],
    );
  }
}
