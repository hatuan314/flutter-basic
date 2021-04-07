import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';

class headerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().screenWidth,
      height: ScreenUtil().setHeight(230),
      color: Colors.transparent,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
            ScreenUtil().setWidth(25), 0, ScreenUtil().setWidth(60), 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create your todo',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil().setSp(25)),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.assignment_ind_outlined,
                      color: Colors.white,
                      size: ScreenUtil().setSp(25),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      '03/04/2021',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScreenUtil().setSp(15)),
                    )
                  ],
                )
              ],
            ),
            Container(
              width: ScreenUtil().setHeight(100),
              height: ScreenUtil().setHeight(100),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/kitGroup.png'))),
            )
          ],
        ),
      ),
    );
  }
}
