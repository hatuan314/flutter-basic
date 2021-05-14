import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/model/model_map.dart';

class AddWidget extends StatelessWidget {
  String group;

  AddWidget({Key key, this.group}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {

      },
      style: TextStyle(fontSize: ScreenUtil().setSp(16)),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1.5),
        ),
        // suffixIcon: Visibility(
        //     visible: index == context.watch<ProviderSchedule>().indexSticky
        //         ? true
        //         : false,
        //     child: Icon(
        //       Icons.error_outline,
        //       size: ScreenUtil().setSp(23),
        //       color: Colors.red,
        //     )),
        prefixIcon: Icon(
          Icons.add_circle_outlined,
          size: ScreenUtil().setSp(25),
          color: Colors.black45,
        ),
        helperStyle:
            TextStyle(color: Colors.black45, fontSize: ScreenUtil().setSp(13)),
      ),
    );
  }
}
