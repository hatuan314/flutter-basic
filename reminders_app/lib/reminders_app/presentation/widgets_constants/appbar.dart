import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:reminders_app/reminders_app/presentation/theme/theme_text.dart';

class AppbarWidget extends AppBar {
  AppbarWidget(BuildContext context,
      {String leadingText,
      String title,
      String actionText,
        Widget onTapAction,
      Function onTapCancel})
      : super(
            elevation: 0,
            leadingWidth: title=='Details'?ScreenUtil().screenWidth / 4:ScreenUtil().screenWidth / 5,
            leading: GestureDetector(
              onTap: onTapCancel!=null?onTapCancel:()=> showDialog(context: context, builder: (_)=>AlertDialog(
                  title:Text('Cancel ?'),
                  actions: [
                    FlatButton(
                      onPressed: () {Navigator.pop(context);},
                      child: Text('No'),
                    ),
                    FlatButton(
                      onPressed: () {Navigator.pop(context);Navigator.pop(context);},
                      child: Text('Yes'),
                    ),])),
              child: Container(
                child: Row(
                  children: [
                    Visibility(
                      visible: title=='Details'?true:false,
                      child: Expanded(
                        flex: 1,
                        child: Icon(Icons.arrow_back_ios_rounded,
                            color: Colors.blue, size: ScreenUtil().setSp(15)),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          leadingText ?? '',
                          textAlign: TextAlign.center,
                          style: ThemeText.button.copyWith(
                              color: Colors.blue, fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: Colors.transparent,
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(16),
                  fontWeight: FontWeight.w700),
            ),
            actions: [
              onTapAction
           /*   GestureDetector(
                onTap: onTapAction,
                child: Container(
                  //color: Colors.blue,
                  width: ScreenUtil().screenWidth / 6,
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      actionText ?? '',
                      style: ThemeText.button.copyWith(
                          color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),*/
            ]);
}
