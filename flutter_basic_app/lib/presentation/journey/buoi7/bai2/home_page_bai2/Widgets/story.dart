import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic_app/presentation/journey/buoi7/bai2/home_page_bai2/Widgets/My_Pained.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container storyWidget() {
  List _list = [
    {
      'img':
          'https://genk.mediacdn.vn/thumb_w/690/2019/9/5/photo-1-1567657782209919182368.png',
      'hot': false
    },
    {
      'img': 'https://afamilycdn.com/2017/photo-11-1495360468487.png',
      'hot': true
    },
    {
      'img':
          'https://danviet.mediacdn.vn/upload/1-2017/images/2017-01-21/148498866074167-11-thuy-vi-5.jpg',
      'hot': false
    },
    {
      'img':
          'https://lh3.googleusercontent.com/proxy/o5gqeXiHC65pi2-PXXaaJ1eMuhd4NM0pMfA9wdX4fUJ3e0ur1fmYNl-x0nSW1_-vE9-gM3rXX-nL7uOfTV8s3PT41089NayZLwt3LijKbmTUsxc_BFx8Ni6SyavIKtK27usJx57X95WTIE_dZCITsTBwHHk',
      'hot': true
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': true
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
    {
      'img':
          'https://i.pinimg.com/originals/89/77/1c/89771c11bdfc776662c425976ea8533c.png',
      'hot': false
    },
  ];
  return Container(
    height: ScreenUtil().setHeight(130),
    width: double.infinity,
    color: Colors.transparent,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(right: 30, top: 20,left: 2),
              child: Stack(
                children: [
                  CircularBorder(
                    width: 4,
                    size: ScreenUtil().setSp(90),
                    color: Colors.redAccent,
                    icon: Container(
                      height: ScreenUtil().setSp(72),
                      width: ScreenUtil().setSp(72),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(_list[index]['img']))),
                    ),
                  ),
                  _list[index]['hot']
                      ? Positioned(
                          bottom: ScreenUtil().setHeight(10),
                          right: ScreenUtil().setWidth(11),
                          child: Container(
                              height: ScreenUtil().setHeight(25),
                              width: ScreenUtil().setWidth(60),
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerRight,
                                      end: Alignment.centerLeft,
                                      colors: [
                                        Colors.red.shade800,
                                        Colors.redAccent
                                      ]),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  'HOT',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: ScreenUtil().setSp(13),
                                      fontWeight: FontWeight.w700),
                                ),
                              )))
                      : Text(''),
                ],
              ));
        }),
  );
}
