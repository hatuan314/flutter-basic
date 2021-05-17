
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghichu/presentation/journey/home/home_page/home_page_constants.dart';
import 'package:ghichu/presentation/journey/home/widgets/information_reminder_widget.dart';

class SightWidget extends StatelessWidget {
  int index;

  SightWidget({Key key,this.index}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
          margin: EdgeInsets.only(top: HomePageConstants.paddingHeight20),
          width: index==2?double.infinity:ScreenUtil().screenWidth / 2 - HomePageConstants.widthContainer,
          height: HomePageConstants.heightContainer,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(HomePageConstants.radiusCircle15)),
          child: InformationWidget(index: index,)),
    );
  }
}
