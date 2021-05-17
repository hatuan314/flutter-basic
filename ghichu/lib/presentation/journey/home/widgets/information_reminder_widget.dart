import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';
import 'package:ghichu/presentation/journey/widgets/icon_widget.dart';

class InformationWidget extends StatelessWidget {
  int index;
  InformationWidget({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
          HomePageConstants.paddingWidth10,
          HomePageConstants.paddingHeight10,
          HomePageConstants.paddingWidth20,
          HomePageConstants.paddingHeight10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconWidget(
                icon: HomePageConstants.list[index]['icons'],
                shadow: 0,
                color: HomePageConstants.list[index]['colors'],
                colorGraient: HomePageConstants.list[index]['colors'],
              ),
              Text(
                '${HomePageConstants.list[index]['sum']}',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: ScreenUtil().setSp(37)),
              )
            ],
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '${HomePageConstants.list[index]['title']}',
                  style: TextStyle(
                      color: Colors.black45,
                      fontSize: ScreenUtil().setSp(15),
                      fontWeight: FontWeight.w700),
                )),
          )
        ],
      ),
    );
  }
}
