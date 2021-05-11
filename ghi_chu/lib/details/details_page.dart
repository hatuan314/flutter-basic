
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/details/provider_details_page.dart';
import 'package:ghi_chu/details/widgets/time_widget.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatefulWidget {
  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<DetailsPage> {
  bool date = false;
var moDel;
  @override
  Widget build(BuildContext context) {
    moDel = ModalRoute.of(context).settings.arguments;
    // context.read<ProviderDetailsPage>().setdateTime(moDel[1], moDel[2]);
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: ScreenUtil().setWidth(150),
        leading: GestureDetector(
          onTap: () {
            context.read<ProviderDetailsPage>().removePage(context);
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
              onTap:(){},
              child: Text(
                'Add',
                style: TextStyle(
                    color: Colors.black26,
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
            children: [TimeWidget()],
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
      context.read<ProviderDetailsPage>().upDateTime();
    });
  }
}
