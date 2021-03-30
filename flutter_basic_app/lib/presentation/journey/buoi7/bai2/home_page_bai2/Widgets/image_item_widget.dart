import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai2/__mock__/image_mock.dart';
import 'package:flutter_screenutil/screen_util.dart';

class ImageItemWidget extends StatelessWidget {
  final int index;

  const ImageItemWidget({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: NetworkImage(listImage[index]['img']), fit: BoxFit.fill)),
      child: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listImage[index]['name'],
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: ScreenUtil().setSp(18)),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
              decoration: BoxDecoration(
                  color: listImage[index]['colors'],
                  borderRadius: BorderRadius.all(Radius.circular(9))),
              child: Text(
                listImage[index]['kieu'],
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: ScreenUtil().setSp(16)),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
  
}