import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ghi_chu/all_page/prrovider_all_page.dart';
import 'package:ghi_chu/common/constants/route_constants.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:provider/provider.dart';

class AddWidget extends StatelessWidget {
  String group;
  List<TextEditingController> controller;
  int index;
  AddWidget({Key key, this.group, this.controller, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller[index],
      onTap: () {
        Provider.of<ProviderAllPage>(context, listen: false).indexReminder =
            null;
        if (index !=
            Provider.of<ProviderAllPage>(context, listen: false).indexGroup) {
          for (int i = 0; i < ModelListReminder.myList.length; i++) {
            if (controller[i].text.isNotEmpty &&
                index !=
                    Provider.of<ProviderAllPage>(context, listen: false)
                        .indexGroup) {
              context.read<ProviderAllPage>().addAll(
                  Provider.of<ProviderAllPage>(context, listen: false).group,
                  controller[i].text);
            }
            controller[i].text = '';
          }
        }
        Provider.of<ProviderAllPage>(context, listen: false).setGroup(group);
        context.read<ProviderAllPage>().indexGroup = index;
      },
      style: TextStyle(fontSize: ScreenUtil().setSp(16)),
      decoration: InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1.5),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black45, width: 1.5),
        ),
        suffixIcon: Visibility(
            visible: index == context.watch<ProviderAllPage>().indexGroup
                ? true
                : false,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, RouteList.editReminder,
                    arguments: {
                      'group': group,
                      'title': controller[index].text,
                      'note': '',
                      'date': null,
                      'time': false,
                      'createAt':DateTime.now().millisecondsSinceEpoch,
                      'reminder':'none'
                    }).whenComplete((){
                  for (int i = 0; i < ModelListReminder.myList.length; i++) {
                    controller[i].text = '';
                  }
                  context.read<ProviderAllPage>().upDate();
                });
              },
              child: Icon(
                Icons.error_outline,
                size: ScreenUtil().setSp(23),
                color: Colors.red,
              ),
            )),
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
