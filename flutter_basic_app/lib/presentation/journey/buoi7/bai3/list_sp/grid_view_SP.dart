import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Column grid_view_sp() {
  List _list=[
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
     'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
  },
    {'img':'https://bizweb.dktcdn.net/100/350/935/files/hinh-12-eb0c0a65-ccb4-48f6-b6c5-0f6bbe6647ac.jpg?v=1577500279847',
      'name':'Women Fashion Blouse',
      'sao':4,
      'price':'1200.00'
    },
    {'img':'https://kenh14cdn.com/2018/3/18/fbdfvf-15213686658572009433275.jpg',
      'name':'Fashion Sweater',
      'sao':5,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':1,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
    {'img':'https://image.thanhnien.vn/800/uploaded/congthang/2020_03_07/lnt2_vzkx.jpg',
      'name':'Fashion Jacket',
      'sao':3,
      'price':'2200.00'
    },
  ];
  return Column(
    children: [
      Container(
        width: double.infinity,
        height: ScreenUtil().setHeight(70),
        color: Colors.amber,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 15),
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(3)),
                boxShadow: [BoxShadow()]),
            child: Center(
                child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search by products price'),
            )),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Expanded(
          child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              childAspectRatio: 0.7,
              padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
              children: List.generate(_list.length, (index) {
                return Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Container(
                        height: ScreenUtil().setHeight(180),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            image: DecorationImage(
                                image: NetworkImage(
                              _list[index]['img']
                                ),
                                fit: BoxFit.fill)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: ScreenUtil().setSp(30),
                                height: ScreenUtil().setSp(30),
                                decoration: BoxDecoration(
                                    color: Colors.grey, shape: BoxShape.circle),
                                child: Icon(
                                  Icons.star,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                      _list[index]['name'],
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: ScreenUtil().setSp(15)),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < 5; i++) (
                              Icon(Icons.star,size: ScreenUtil().setSp(18),color: i<_list[index]['sao']?Colors.yellow:Colors.grey,)
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Price:',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: ScreenUtil().setSp(17),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            'Rs. ${_list[index]['price']}',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: ScreenUtil().setSp(18),
                                fontWeight: FontWeight.w700),
                          )
                        ],
                      )
                    ],
                  ),
                );
              })))
    ],
  );
}
