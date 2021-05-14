import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';

import 'package:ghi_chu/home_page/provider_home_page.dart';
import 'package:ghi_chu/home_page/widgets/scheduled_widget.dart';
import 'package:ghi_chu/home_page/widgets/today_widget.dart';
import 'package:provider/provider.dart';
class WrapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible:  context.watch<ProviderHomePage>().edit,
      maintainAnimation: true,
      maintainState: true,
      child: AnimatedOpacity(
        opacity: context.watch<ProviderHomePage>().edit?1:0,
        duration: Duration(milliseconds: 500),
        child: Wrap(
            spacing: ScreenUtil().setWidth(20),
            children: List.generate(3, (index) {
              return index == 2
                  ? TodayWidget(ConstHomePage.list[index])
                  : ScheduledWidget(
                ConstHomePage.list[index],
              );
            })),
      ),
    );
  }
}
