import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';

class AppBarReminderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Function leading;
  final Function actions;
  final Widget textLeft;
  final Widget title;
  final Widget textRight;
  const AppBarReminderWidget(
      {Key key,
      this.leading,
      this.actions,
      @required this.textLeft,
      this.title,
      this.textRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Center(
          child: GestureDetector(
              onTap: leading,
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_rounded,
                      color: Colors.blue, size: ScreenUtil().setSp(21)),
                  textLeft == null ? SizedBox() : textLeft
                ],
              ))),
      leadingWidth: ScreenUtil().setWidth(150),
      centerTitle: true,
      title: title == null ? SizedBox() : title,
      actions: [
        Center(
          child: GestureDetector(
              onTap: actions,
              child: textRight == null ? SizedBox() : textRight),
        ),
        SizedBox(
          width: HomePageConstants.paddingWidth10,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 60);
}
