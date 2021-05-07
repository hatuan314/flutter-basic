import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:ghi_chu/Details/Provider.dart';
import 'package:ghi_chu/Details/Widgets/time_Widget.dart';
import 'package:ghi_chu/New_Reminder/ProviderReminder.dart';
import 'package:provider/provider.dart';

class detailsPage extends StatefulWidget {
  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  bool date = false;

  @override
  Widget build(BuildContext context) {
    switchdate.moDel = ModalRoute.of(context).settings.arguments;
    // context.read<switchdate>().setdateTime(moDel[1], moDel[2]);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: ScreenUtil().setWidth(150),
        leading: GestureDetector(
          onTap: () {
            switchdate().removePage(context);
          },
          child: Row(
            children: [
              Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.blue,
              ),
              Text(
                'New Reminder',
                style: TextStyle(
                    color: Colors.blue, fontSize: ScreenUtil().setSp(15)),
              )
            ],
          ),
        ),
        title: Text(
          'Details',
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(18)),
        ),
        centerTitle: true,
        actions: [
          Center(
            child: GestureDetector(
              onTap: switchdate.moDel[0]['button']
                  ? () {
                // set lại date and time
                      try {
                        providerReminder.getluestime[0]['date'] = switchdate.getdataTime;
                      } catch (_) {
                        if (switchdate.gettime) {
                          providerReminder.getluestime = [
                            {
                              'date': switchdate.getdataTime,
                              'time': [
                                switchdate.gethour,
                                switchdate.getminuner
                              ].toList()
                            }
                          ];
                        } else {
                          providerReminder.getluestime = [
                            {'date': switchdate.getdataTime, 'time': ''}
                          ];
                        }
                      }
                      providerReminder().addTodoList(
                          context,
                          switchdate.moDel[0]['title'],
                          switchdate.moDel[0]['note']);
                    }
                  : null,
              child: Text(
                'Add',
                style: TextStyle(
                    color: switchdate.moDel[0]['button']
                        ? Colors.blue
                        : Colors.black26,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(18)),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: ScreenUtil().setWidth(15),
              right: ScreenUtil().setWidth(15)),
          child: Column(
            children: [timeWidget()],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<switchdate>().setdatetime();
    });
  }
}
