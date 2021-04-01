
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import '../like_post.dart';
import 'package:provider/provider.dart';
Widget insPost(BuildContext context) {
  final item = Provider.of<Like>(context);
  return Container(
    color: Colors.black,
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(5),
          bottom: ScreenUtil().setHeight(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/ava.jpg'),
                )),
            Expanded(
                flex: 4,
                child: Text(
                  'callmeyuiran',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: ScreenUtil().setSp(16),
                      fontWeight: FontWeight.w700),
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        onDoubleTap: () => item.likePost(),
            //()=> (context.watch<Like>().like==false)?context.read<Like>().likePost():context.read<Like>().unlikePost(),
        child: Container(

          height: ScreenUtil().screenWidth,
          width: ScreenUtil().screenWidth,
          child: Image.asset(
            'assets/images/1.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
          top: ScreenUtil().setHeight(5),
          bottom: ScreenUtil().setHeight(5),
        ),
        child: Container(
          color: Colors.black,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        (context.watch<Like>().like==true)?Icons.favorite:Icons.favorite_outline_outlined,
                        color: ((context.watch<Like>().like==true)?Colors.red:Colors.white),
                        size: 32,
                      ),
                     onPressed:()=>(item.like==true?item.unlikePost():item.likePost()),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.messenger_outline,
                        color: Colors.white,
                        size: 32,
                      ),
                      //onPressed: onPressed
                    ),
                   IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 32,
                      ),
                      //onPressed: onPressed
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: IconButton(
                icon: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: ScreenUtil().setSp(32),
                ),
              ))
            ],
          ),
        ),
      ),
      Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          // color: Colors.pinkAccent,
          height: ScreenUtil().setHeight(40),
          width: ScreenUtil().setHeight(80),
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              Positioned(
                  left: ScreenUtil().setWidth(40),
                  child: SizedBox(
                    height: ScreenUtil().setHeight(25),
                    width: ScreenUtil().setHeight(25),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/ava.jpg'),
                    ),
                  )),
              Positioned(
                  left: ScreenUtil().setWidth(25),
                  child: SizedBox(
                    height: ScreenUtil().setHeight(25),
                    width: ScreenUtil().setHeight(25),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/ava.jpg'),
                    ),
                  )),
              Positioned(
                  left: ScreenUtil().setWidth(10),
                  child: SizedBox(
                    height: ScreenUtil().setHeight(25),
                    width: ScreenUtil().setHeight(25),
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/ava.jpg'),
                    ),
                  )),
            ],
          ),
        ),
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'Người thích:',
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: ' thuylinh.9121999',
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.w800),
          ),
          TextSpan(
            text: ' và ',
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.w400),
          ),
          TextSpan(
            text: '6 người\nkhác ',
            style: TextStyle(
                color: Colors.white,
                fontSize: ScreenUtil().setSp(18),
                fontWeight: FontWeight.w800),
          ),
        ])),
      ]),
      Padding(
        padding:EdgeInsets.only(left: ScreenUtil().setWidth(10)),
      child:
      RichText(
          text: TextSpan(children: [
        TextSpan(
          text: 'callmeyuiran',
          style: TextStyle(
              color: Colors.white,
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.w800),
        ),
        TextSpan(
          text: ' ... thêm',
          style: TextStyle(
              color: Colors.grey,
              fontSize: ScreenUtil().setSp(18),
              fontWeight: FontWeight.w400),
        ),
      ])),
      )
    ]),
  );
}
