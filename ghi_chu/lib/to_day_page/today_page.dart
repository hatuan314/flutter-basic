import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/model/model_map.dart';
import 'package:intl/intl.dart';
import 'package:ghi_chu/to_day_page/provider_to_day.dart';
import 'package:provider/provider.dart';

class TodayPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<TodayPage> {
  int lenghtToDay = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(
            '${ModelListReminder.listReminder.values.elementAt(0)['${Provider.of<ProviderToday>(context, listen: false).nowDate}']}');
      },
      child: Scaffold(
        appBar: _appBar(context),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hôm nay',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w800,
                    fontSize: ScreenUtil().setSp(30)),
              ),
              // ModelListReminder.listReminder.values.elementAt(index)['${Provider.of<ProviderToday>(context,listen: false).nowDate}'].length
              Column(
                  children: List.generate(
                      ModelListReminder.listReminder.values.elementAt(0).isEmpty
                          ? 0
                          : ModelListReminder.listReminder.values.length,
                      (index) {
                return Column(
                  children: List.generate(
                      ModelListReminder.listReminder.values.elementAt(index)[
                                  '${Provider.of<ProviderToday>(context, listen: false).nowDate}'] ==
                              null
                          ? 0
                          : ModelListReminder.listReminder.values
                              .elementAt(index)[
                                  '${Provider.of<ProviderToday>(context, listen: false).nowDate}']
                              .length, (index1) {
                    return Row(
                      children: [
                        Icon(Icons.check_circle_outline_outlined),
                        SizedBox(
                          width: ScreenUtil().setWidth(10),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.only(
                              bottom: ScreenUtil().setHeight(10),
                              top: ScreenUtil().setHeight(10)),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.black12))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${ModelListReminder.listReminder.values.elementAt(index)['${Provider.of<ProviderToday>(context, listen: false).nowDate}'][index1].title}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: ScreenUtil().setSp(16)),
                              ),
                              SizedBox(
                                height: ScreenUtil().setHeight(5),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '${ModelListReminder.listReminder.values.elementAt(index)['${Provider.of<ProviderToday>(context, listen: false).nowDate}'][index1].group}',
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: ScreenUtil().setSp(14)),
                                  ),
                                  Visibility(
                                      visible: ModelListReminder
                                          .listReminder.values
                                          .elementAt(index)[
                                              '${Provider.of<ProviderToday>(context, listen: false).nowDate}']
                                              [index1]
                                          .time,
                                      child: Text(
                                        ' - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(ModelListReminder.listReminder.values.elementAt(index)['${Provider.of<ProviderToday>(context, listen: false).nowDate}'][index1].date))}',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: ScreenUtil().setSp(14)),
                                      ))
                                ],
                              ),
                              Visibility(
                                  visible: ModelListReminder.listReminder.values
                                              .elementAt(index)[
                                                  '${Provider.of<ProviderToday>(context, listen: false).nowDate}']
                                                  [index1]
                                              .note ==
                                          ''
                                      ? false
                                      : true,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: ScreenUtil().setHeight(5),
                                      ),
                                      Text(
                                        '${ModelListReminder.listReminder.values.elementAt(index)['${Provider.of<ProviderToday>(context, listen: false).nowDate}'][index1].note}',
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: ScreenUtil().setSp(14)),
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ))
                      ],
                    );
                  }),
                );
              }))
              // Column(
              //     children: List.generate(
              //         Provider.of<ProviderToday>(context, listen: true)
              //             .list
              //             .length, (index) {
              //   return Row(
              //     children: [
              //       Icon(Icons.check_circle_outline_outlined),
              //       SizedBox(
              //         width: ScreenUtil().setWidth(10),
              //       ),
              //       Expanded(
              //           child: Container(
              //         padding: EdgeInsets.only(
              //             bottom: ScreenUtil().setHeight(10),
              //             top: ScreenUtil().setHeight(10)),
              //         decoration: BoxDecoration(
              //             border: Border(
              //                 bottom: BorderSide(color: Colors.black12))),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               '${context.watch<ProviderToday>().list[index].title}',
              //               style: TextStyle(
              //                   color: Colors.black,
              //                   fontSize: ScreenUtil().setSp(16)),
              //             ),
              //             SizedBox(
              //               height: ScreenUtil().setHeight(5),
              //             ),
              //             Row(
              //               children: [
              //                 Text(
              //                     '${context.watch<ProviderToday>().list[index].group}',style: TextStyle(color: Colors.black45,fontSize: ScreenUtil().setSp(14)),),
              //                 Visibility(
              //       visible:context.watch<ProviderToday>().list[index].time,
              //                     child: Text(' - ${DateFormat('HH:mm').format(DateTime.fromMillisecondsSinceEpoch(context.watch<ProviderToday>().list[index].date))}',style: TextStyle(color: Colors.black45,fontSize: ScreenUtil().setSp(14)),))
              //               ],
              //             ),
              //             Visibility(
              //                 visible:context.watch<ProviderToday>().list[index].note==''?false:true,
              //                 child:  Column(
              //                   children: [
              //                     SizedBox(
              //                       height: ScreenUtil().setHeight(5),
              //                     ),
              //                     Text('${context.watch<ProviderToday>().list[index].note}',style: TextStyle(color: Colors.black45,fontSize: ScreenUtil().setSp(14)),)
              //                   ],
              //                 )
              //             )
              //           ],
              //         ),
              //       ))
              //     ],
              //   );
              // }))
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_rounded,
              size: ScreenUtil().setSp(20),
              color: Colors.blue,
            ),
            Text(
              'Danh sách',
              style: TextStyle(
                  color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
            )
          ],
        ),
      ),
      leadingWidth: ScreenUtil().setWidth(100),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<ProviderToday>().getToday();
    });
  }
}
