

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class history extends StatefulWidget {

  @override
  historyState createState() => historyState();

}

class historyState extends State<history> {
List _text=[{'text':'All'},{'text':'Income'},{'text':'Outcome'}];
List iconyesterday=[{'icon':'assets/img/youtube.png','title':'Youtube Pro','gia':'+đ20'},
  {'icon':'assets/img/prosen.png','title':'From Malik Umimanyu','gia':'+đ64'},
  {'icon':'assets/img/spofy.png','title':'Spotify','gia':'+đ16'},
  {'icon':'assets/img/youtube.png','title':'Youtube Pro','gia':'+đ20'},
  {'icon':'assets/img/youtube.png','title':'Youtube Pro','gia':'+đ20'},
  {'icon':'assets/img/youtube.png','title':'Youtube Pro','gia':'+đ20'}
];
List icontusday=[{'icon':'assets/img/figama.png','title':'Figma Pro','gia':'-đ130'},
  {'icon':'assets/img/creatte.png','title':'Pro Create Premium','gia':'-đ14'},
  {'icon':'assets/img/quabong.png','title':'Spotify','gia':'-đ230'},
  {'icon':'assets/img/prosen.png','title':'Youtube Pro','gia':'+đ2000'},
  {'icon':'assets/img/youtube.png','title':'Youtube Pro','gia':'+đ20'},
  {'icon':'assets/img/youtube.png','title':'Youtube Pro','gia':'+đ20'}
];
int vitri=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
leading: BackButton(
  color: Colors.black87,
),
        actions: [
          Container(
            height: 30,
            width: 300,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Transaction History',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.75),
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),

                Text(
                  '...',
                  style: TextStyle(color: Colors.black, fontSize: 35),
                ),
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
        child: Column(
          children: [
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.all(Radius.circular(15))
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                  itemBuilder:(context,index){
                  return GestureDetector(
                    onTap: (){
                      vitri=index;
                      setState(() {
                        
                      });
                    },
                    child: Container(
                      width: 127,
                      decoration: BoxDecoration(
                          color: index==vitri?Colors.deepPurple:Colors.transparent,
                          borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: Center(child: Text(_text[index]['text'],style: TextStyle(color:index==vitri?Colors.white:Colors.blue,fontWeight: FontWeight.w500),)),
                    ),
                  );
                  }
              )
            ),
            SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Yesterday',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),),
                Text('24 Feb,2021',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black26,fontSize: 12)),
              ],
            ),
             SizedBox(
               height: 15,
             ),
             Container(
               height: 250,
               color: Colors.transparent,
               child: ListView.builder(
                 itemCount: iconyesterday.length,
                   itemBuilder: (context,index){
                     return Padding(
                       padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                       child: Container(
                         height: 50,
                         decoration: BoxDecoration(
                             color: Colors.white10,
                             borderRadius: BorderRadius.all(Radius.circular(2))
                         ),
                         child: Row(
                           children: [
                             Container(
                               height: 50,
                               width: 50,
                               decoration: BoxDecoration(
                                   color: Colors.teal.withOpacity(0.1),
                                   borderRadius: BorderRadius.all(Radius.circular(17))
                               ),
child: Image.asset(iconyesterday[index]['icon']),
                             ),
                             SizedBox(
                               width: 20,
                             ),
                           Container(
                            width: 310,
                             color: Colors.transparent,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   children: [
                                     Text('${iconyesterday[index]['title']}',style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 13),),
                                     SizedBox(
                                       height: 4,
                                     ),
                                     Text('Yesterday,01:15 pm',style: TextStyle(color: Colors.black26,fontSize: 14,fontWeight: FontWeight.w500))
                                   ],
                                 ),
                                 SizedBox(
                                   width: 90,
                                 ),
                                 Text('${iconyesterday[index]['gia']}',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black45),)
                               ],
                             ),
                           )
                           ],
                         ),
                       ),
                     );
                   }
               ),
             ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Tuesday',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black45),),
                Text('23 Feb,2021',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black26,fontSize: 12)),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 300,
              color: Colors.transparent,
              child: ListView.builder(
                itemCount: icontusday.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.white10,
                            borderRadius: BorderRadius.all(Radius.circular(2))
                        ),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.teal.withOpacity(0.1),
                                  borderRadius: BorderRadius.all(Radius.circular(17))
                              ),
child: Image.asset(icontusday[index]['icon']),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              width: 310,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${icontusday[index]['title']}',style: TextStyle(color: Colors.black.withOpacity(0.8),fontWeight: FontWeight.bold,fontSize: 13),),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Text('Yesterday,01:15 pm',style: TextStyle(color: Colors.black26,fontSize: 14,fontWeight: FontWeight.w500))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 90,
                                  ),
                                  Text('${icontusday[index]['gia']}',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.black45),)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
