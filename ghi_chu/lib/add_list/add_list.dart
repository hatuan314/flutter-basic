import 'dart:ui';

import 'package:ghi_chu/add_list/provider_new_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:ghi_chu/__mock__/costranisn.dart';

class NewListPage extends StatelessWidget {
  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Center(
            child: GestureDetector(
          onTap: () {
            if (Provider.of<ProviderNewList>(context, listen: false).button) {
              _showButtonModalSheet(context);
            } else {
              Navigator.pop(context);
            }
          },
          child: Text(
            'Hủy',
            style:
                TextStyle(color: Colors.blue, fontSize: ScreenUtil().setSp(16)),
          ),
        )),
        centerTitle: true,
        title: Text(
          'Danh sách Mới',
          style:
              TextStyle(color: Colors.black, fontSize: ScreenUtil().setSp(20)),
        ),
        actions: [
          Center(
            child: GestureDetector(
              onTap: context.watch<ProviderNewList>().button
                  ? () {
                      ProviderNewList().addToDoMyList(
                          Provider.of<ProviderNewList>(context, listen: false)
                              .title,
                          Provider.of<ProviderNewList>(context, listen: false)
                              .color
                              .value
                              .toString(),
                          DateTime.now().millisecondsSinceEpoch,
                          DateTime.now().millisecondsSinceEpoch);
                      Navigator.pop(context);
                    }
                  : null,
              child: Text(
                'Xong',
                style: TextStyle(
                    color: context.watch<ProviderNewList>().button
                        ? Colors.blue
                        : Colors.black26,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(18)),
              ),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(10),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Center(
                child: Container(
                  width: ScreenUtil().setWidth(100),
                  height: ScreenUtil().setWidth(100),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            context
                                .watch<ProviderNewList>()
                                .color
                                .withOpacity(0.6),
                            context.watch<ProviderNewList>().color
                          ]),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 0,
                            offset: Offset(0, 5))
                      ]),
                  child: Icon(
                    Icons.list,
                    size: ScreenUtil().setWidth(70),
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              TextField(
                controller: _textEditingController,
                textAlign: TextAlign.center,

                style: TextStyle(
                    color: context.watch<ProviderNewList>().color,
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil().setSp(23)),
                decoration: InputDecoration(
                  // isDense: true,
                  contentPadding: EdgeInsets.zero,
                  suffixIcon: Visibility(
                      visible: context.watch<ProviderNewList>().button,
                      child: GestureDetector(
                          onTap: () {
                            _textEditingController.text = '';
                            context.read<ProviderNewList>().setButton('');
                          },
                          child: Icon(
                            Icons.cancel,
                            size: ScreenUtil().setSp(24),
                            color: Colors.black26,
                          ))),
                  filled: true,
                  fillColor: Colors.black12.withOpacity(0.05),
                  focusedBorder: OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.transparent),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: new BorderSide(color: Colors.white),
                    borderRadius: new BorderRadius.circular(10),
                  ),
                  border: InputBorder.none,
                ),
                onChanged: (value) {
                  context.read<ProviderNewList>().setButton(value);
                },
              ),
              SizedBox(
                height: ScreenUtil().setHeight(30),
              ),
              Wrap(
                children:
                    List.generate(ConstHomePage.listColors.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      context.read<ProviderNewList>().setIndex(index);
                      context
                          .read<ProviderNewList>()
                          .setColor(ConstHomePage.listColors[index]);
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          left: ScreenUtil().setWidth(10),
                          top: ScreenUtil().setHeight(10)),
                      height: ScreenUtil().setWidth(50),
                      width: ScreenUtil().setWidth(50),
                      padding: EdgeInsets.all(ScreenUtil().setSp(3)),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index ==
                                      context
                                          .watch<ProviderNewList>()
                                          .indexColor
                                  ? Colors.black45
                                  : Colors.transparent,
                              width: 2),
                          shape: BoxShape.circle),
                      child: Container(
                        height: ScreenUtil().setWidth(50),
                        width: ScreenUtil().setWidth(50),
                        decoration: BoxDecoration(
                            color: ConstHomePage.listColors[index],
                            shape: BoxShape.circle),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }

  dynamic _showButtonModalSheet(BuildContext context) {
    return showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            width: ScreenUtil().screenWidth,
            height: ScreenUtil().setHeight(150),
            color: Colors.transparent,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: ScreenUtil().setHeight(60),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        'Hủy bỏ thay đổi',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: ScreenUtil().setSp(23)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: ScreenUtil().setHeight(10),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: ScreenUtil().setHeight(60),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Text(
                        'Hủy',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: ScreenUtil().setSp(23),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
