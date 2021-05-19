import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/blocs/check_buttom.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final BlocCheckButton blocCheckButton;
  final Function leading;
  final Function actions;
  final String textLeft;
  final String title;
  final String textRight;

  const AppBarWidget(
      {Key key,
      this.blocCheckButton,
      this.leading,
      this.actions,
      this.textLeft,
      this.title,
      this.textRight})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                        color: blocCheckButton.check
                            ? Colors.blue
                            : Colors.black38,
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

  @override
  Size get preferredSize => Size(double.infinity, 64);
}
