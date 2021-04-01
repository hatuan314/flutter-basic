import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_8/bai_2/widget/bottom_navigation_bar.dart';
import 'package:flutter_basic_app/presentation/journey/buoi_8/bai_2/widget/ins_post.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'widget/b2_appbar.dart';
import 'package:provider/provider.dart';

class B8Bai2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor: Colors.black,
        appBar: b2Appbar(),
        body: Stack(
          fit: StackFit.loose,
          children: [
            Scaffold(
              backgroundColor: Colors.black,
              body: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Padding(
                    padding:   EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(30),
                    ),
                    child: insPost(context),
                  ),
                  Padding(
                    padding:   EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(10),
                    ),
                    child: insPost(context),
                  ),
                  Padding(
                    padding:   EdgeInsets.only(
                      bottom: ScreenUtil().setHeight(10),
                    ),
                    child: insPost(context),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              height: ScreenUtil().screenHeight / 10,
              width: ScreenUtil().screenWidth,
              child: bottomNavigationBar(),
            ),
          ],
        ));
  }
}
