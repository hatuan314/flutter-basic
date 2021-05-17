
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';

AppBar appBar(
    BuildContext context,
    BlocCheckButton blocCheckButton,
    Function leading,
    Function actions,
    String textLeft,
    String title,
    String textRight) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    leading: Center(
        child: StreamBuilder<Object>(
            stream: blocCheckButton.checkButtom,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: blocCheckButton.check
                    ? leading
                    : () {
                        Navigator.pop(context);
                      },
                child: Text(
                  textLeft,
                  style: TextStyle(
                      color: Colors.blue, fontSize: ScreenUtil().setSp(16)),
                ),
              );
            })),
    centerTitle: true,
    title: Text(
      title,
      style: TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(20)),
    ),
    actions: [
      Center(
        child: StreamBuilder<Object>(
            stream: blocCheckButton.checkButtom,
            builder: (context, snapshot) {
              return GestureDetector(
                onTap: blocCheckButton.check ? actions : null,
                child: Text(
                  textRight,
                  style: TextStyle(
                      color:
                          blocCheckButton.check ? Colors.blue : Colors.black38,
                      fontWeight: FontWeight.w600,
                      fontSize: HomePageConstants.screenUtileSp18),
                ),
              );
            }),
      ),
      SizedBox(
        width: HomePageConstants.paddingWidth10,
      ),
    ],
  );
}
