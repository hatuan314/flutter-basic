import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai2/__mock__/image_mock.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai2/home_page_bai2/Widgets/image_item_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

GridView gridViewbai2() {
  return GridView.count(
    crossAxisCount: 2,
    crossAxisSpacing: 10,
    mainAxisSpacing: 10,
    childAspectRatio: 0.8,
    children: List.generate(listImage.length, (index) {
      return ImageItemWidget(
        index: index,
      );
    }),
  );
}
