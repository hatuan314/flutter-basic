import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
GridView gridViewbai2(){
  List _list=[
    {'img':'https://i.pinimg.com/originals/11/1e/1e/111e1e1d5a692e96ef4d92cb8cdc14b0.jpg',
    'name':'Isaac McCarthy',
      'kieu':'Versatile',
      'colors':Colors.redAccent
    },
    {'img':'https://kimloanhairsalon.com/wp-content/uploads/2019/09/T%C3%B3c-d%C3%A0i-t%E1%BB%B1-nhi%C3%AAn.jpg',
      'name':'Fred Maxwell',
      'kieu':'Top',
      'colors':Colors.teal
    },
    {'img':'https://lh3.googleusercontent.com/proxy/kNL9847ZXjNpO4aG7Lx05rVjYj3RNt2NpvIQNu2MEq1NcHe0xp0ck7BZrFm2BunvX_jKIcccLNROH8Zq2CsccZ-2rthTfap6pL1WYFOx8LUWdw',
      'name':'Wayne Poole',
      'kieu':'Bottom',
      'colors':Colors.blueAccent
    },
    {'img':'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKjx7VhEgIDfbXYTBvwkGWB2POjJ5yhVQRbQ&usqp=CAU',
      'name':'Tom Fuller',
      'kieu':'Vers-Top',
      'colors':Colors.redAccent
    },
    {'img':'https://lh3.googleusercontent.com/proxy/o5gqeXiHC65pi2-PXXaaJ1eMuhd4NM0pMfA9wdX4fUJ3e0ur1fmYNl-x0nSW1_-vE9-gM3rXX-nL7uOfTV8s3PT41089NayZLwt3LijKbmTUsxc_BFx8Ni6SyavIKtK27usJx57X95WTIE_dZCITsTBwHHk',
      'name':'Isaac McCarthy',
      'kieu':'Versatile',
      'colors':Colors.redAccent
    },
    {'img':'https://mezing.vn/wp-content/uploads/2018/07/anh-gai-tay-xinh.jpg',
      'name':'Isaac McCarthy',
      'kieu':'Versatile',
      'colors':Colors.redAccent
    },
    {'img':'https://i.pinimg.com/originals/11/1e/1e/111e1e1d5a692e96ef4d92cb8cdc14b0.jpg',
      'name':'Isaac McCarthy',
      'kieu':'Versatile',
      'colors':Colors.redAccent
    },
    {'img':'https://i.pinimg.com/originals/11/1e/1e/111e1e1d5a692e96ef4d92cb8cdc14b0.jpg',
      'name':'Isaac McCarthy',
      'kieu':'Versatile',
      'colors':Colors.redAccent
    },
    {'img':'https://i.pinimg.com/originals/11/1e/1e/111e1e1d5a692e96ef4d92cb8cdc14b0.jpg',
      'name':'Isaac McCarthy',
      'kieu':'Versatile',
      'colors':Colors.redAccent
    },
    {'img':'https://i.pinimg.com/originals/11/1e/1e/111e1e1d5a692e96ef4d92cb8cdc14b0.jpg',
      'name':'Isaac McCarthy',
      'kieu':'Versatile',
      'colors':Colors.redAccent
    },
    {'img':'https://i.pinimg.com/originals/11/1e/1e/111e1e1d5a692e96ef4d92cb8cdc14b0.jpg',
      'name':'Isaac McCarthy',
      'kieu':'Versatile',
      'colors':Colors.redAccent
    },
  ];
  return GridView.count(crossAxisCount: 2,
  crossAxisSpacing: 10,
  mainAxisSpacing: 10,
  childAspectRatio: 0.8,
  children: List.generate(_list.length, (index){
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        image: DecorationImage(
          image: NetworkImage(_list[index]['img']),
          fit: BoxFit.fill
        )
      ),
child: Padding(
  padding: const EdgeInsets.only(left: 15),
  child:   Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(_list[index]['name'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700,
      fontSize: ScreenUtil().setSp(18)
      ),),
      Container(
        padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
        decoration: BoxDecoration(
            color: _list[index]['colors'],
          borderRadius: BorderRadius.all(Radius.circular(9))
        ),
        child: Text(_list[index]['kieu'],style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: ScreenUtil().setSp(16)),),
      ),
      SizedBox(
        height: 10,
      )
    ],
  ),
),
    );
  }),
  );
}