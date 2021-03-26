import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class B7Bai3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Column(
        children: [
          _searchBar(),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.only(
                  top: ScreenUtil().setHeight(18),
                  left: ScreenUtil().setWidth(18),
                  right: ScreenUtil().setWidth(18)),
              child: GridView(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: ScreenUtil().setWidth(8),
                    childAspectRatio: 0.69,
                  ),
                  children: [
                    _goodsItem('assets/images/jacket.png', 'Fashion Jacket',
                        '2200.00'),
                    _goodsItem('assets/images/jacket.png', 'Women Fashion Blouse',
                        '1200.00'),
                    _goodsItem('assets/images/jacket.png', 'Fashion Sweater',
                        '2200.00'),
                    _goodsItem('assets/images/jacket.png', 'Fashion Jacket',
                        '11100.00'),
                    _goodsItem('assets/images/jacket.png', 'Fashion Jacket',
                        '2200.00'),
                    _goodsItem('assets/images/jacket.png', 'Fashion Jacket',
                        '2200.00'),
                  ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color.fromRGBO(205, 220, 57, 1),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: ScreenUtil().setSp(28),
          color: Colors.white,
        ),
      ),
      leadingWidth: ScreenUtil().setWidth(30),
      title: Text('New Arrivals',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ScreenUtil().setSp(16.5),
              color: Colors.black)),
      actions: [
        Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(0)),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart_outlined,
                size: ScreenUtil().setSp(30),
                color: Colors.white,
              ),
            )),
        Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(0)),
            child: IconButton(
              icon: Icon(
                Icons.more_vert,
                size: ScreenUtil().setSp(30),
                color: Colors.white,
              ),
            )),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0, 2),
            blurRadius: 3,
          )
        ],
        color: Color.fromRGBO(205, 220, 57, 1),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(15),
            left: ScreenUtil().setWidth(20),
            right: ScreenUtil().setWidth(20)),
        child: Container(
          height: ScreenUtil().setHeight(29),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          padding: EdgeInsets.only(
            bottom: ScreenUtil().setHeight(3),
            top: ScreenUtil().setHeight(3),
            left: ScreenUtil().setWidth(10),
          ),
          child: TextField(
            decoration: InputDecoration(
                enabled: false,
                border: InputBorder.none,
                icon: Icon(
                  Icons.search,
                  size: ScreenUtil().setSp(25),
                ),
                hintText: 'Search by products, price',
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: ScreenUtil().setSp(11),
                )),
          ),
        ),
      ),
    );
  }

  Widget _goodsItem(String imageItem, String nameItem, String priceItem) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
        ),
        child: Stack(children: [
          Padding(
            padding: EdgeInsets.all(ScreenUtil().setWidth(12)),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.55),
                ),
                child: Padding(
                  padding: EdgeInsets.all(ScreenUtil().setWidth(4)),
                  child: Icon(
                    Icons.favorite,
                    color: Colors.white,
                    size: ScreenUtil().setSp(16),
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.all(ScreenUtil().setWidth(15)),
              child: Align(
                alignment: Alignment.center,
                child: Image.asset(imageItem),
              ))
        ]),
      ),
      Padding(
          padding: EdgeInsets.only(top:ScreenUtil().setHeight(7)),
          child:
          Text(nameItem,
          style: TextStyle(

            fontSize: ScreenUtil().setSp(13),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          )
      ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.star,
                size: ScreenUtil().setSp(17),
                color: Color.fromRGBO(205, 220, 57, 1),
              ),
              Icon(Icons.star,
                size: ScreenUtil().setSp(17),
                color: Color.fromRGBO(205, 220, 57, 1),
              ),
              Icon(Icons.star,
                size: ScreenUtil().setSp(17),
                color: Color.fromRGBO(205, 220, 57, 1),
              ),

              Icon(Icons.star,
                size: ScreenUtil().setSp(17),
                color: Colors.grey.withOpacity(0.5),
              ),

              Icon(Icons.star,
                size: ScreenUtil().setSp(17),
                color: Colors.grey.withOpacity(0.5),
              ),
            ],
          ),
        ),
    Padding(
      padding:  EdgeInsets.all(ScreenUtil().setHeight(7.5)),
      child: RichText(text: TextSpan(
        children: [
          TextSpan(
            text: 'Price: ',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.8),
              fontSize: ScreenUtil().setSp(16.5),
            )
          ),
          TextSpan(
            text: 'Rs. '+priceItem,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.red,
                fontSize: ScreenUtil().setSp(16.5),
              )
          )
        ]
      )),
    )
    ]
    );
  }
}
