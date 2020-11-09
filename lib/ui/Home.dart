import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Model/HomeResponse.dart';
import 'package:flutterpractice/network/NetWork.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _Home();
  }
}

class _Home extends State<Home>{
  int _selectedIndex = 0;
  var _PageController = PageController();
  var netWork=new NetWork();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    NetWork n = new NetWork();
    n.getNearBy();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _PageController.jumpToPage(_selectedIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold (
        appBar: AppBar(title: Text("Home")),
        body:
        Container(child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 12,top:10),
                child: Text("Featured workshops",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),),
                HorizentalRecyclerView(),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 12,top:10),

                child: Text("Nearby workshops",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
            Container(child: VerticalRecyclerView(context,netWork),height: 420,),
        //    NewCard(context)
          ],
        )),
    );
  }
}

 Widget HorizentalRecyclerView () => Container(
        alignment: Alignment.topCenter,
       width:  400,
       height:180,
       child:
       ListView(
         scrollDirection: Axis.horizontal,
         children:<Widget> [
           Container(
             width:  400,
           height:100,
           padding: EdgeInsets.all(10),
         child: Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15.0),
           ),
          color: Colors.blue,
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10,top: 10),
                      child: Text("Classic garage",
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                    Spacer(flex: 2),
                    Container(
                      padding: EdgeInsets.only(right: 10,top: 10),
                      alignment:Alignment.topRight ,
                      child: Text("city",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(

                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            'https://e-commerce-dev.intcore.net/uploads/products/MItqele2aABSzQ0Qf9aDiKiayL2RixiY6TCit5DK.jpeg',
                            width: 100,
                            height: 100,
                          ),
                        ),

                        padding: EdgeInsets.all(8),

                    ),
                    Container(child: Column(
                      children: [
                        Row(
                          children: [
                            Container(child: Text("Mechanical"),
                            padding: EdgeInsets.only(bottom: 55),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:80.0,bottom: 55),
                              child: Container(child: Text("200 Projects",
                                 style: TextStyle( color: Colors.white,),
                                textAlign: TextAlign.right,),
                                alignment: Alignment.topRight,),
                            )
                          ],
                        ),
                        Row(children: [



                          Container(
                        //error is here
                        //    child: Text("description ",style: TextStyle( color: Colors.white,),

                          )




                        ],)
                      ],
                    ),)
                  ],
                )
              ],
            ),
          ),
        ),
    ),
           Container(
             width:  400,
             height:100,
             padding: EdgeInsets.all(10),
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               color: Colors.blue,
               child: Container(
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Container(
                           padding: EdgeInsets.only(left: 10,top: 10),
                           child: Text("Classic garage",
                             style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                           ),
                         ),
                         Spacer(flex: 2),
                         Container(
                           padding: EdgeInsets.only(right: 10,top: 10),
                           alignment:Alignment.topRight ,
                           child: Text("city",
                               style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                         ),
                       ],
                     ),
                     Row(
                       children: [
                         Container(

                           child: Image.asset(
                             'images/folder.png',
                             width: 100,
                             height: 100,
                           ),padding: EdgeInsets.all(8),
                         ),
                         Container(child: Column(
                           children: [
                             Row(
                               children: [
                                 Container(child: Text("Mechanical"),),
                                 Padding(
                                   padding: const EdgeInsets.only(left:80.0),
                                   child: Container(child: Text("200 Projects",
                                     style: TextStyle( color: Colors.white,),
                                     textAlign: TextAlign.right,),
                                     alignment: Alignment.topRight,),
                                 )
                               ],
                             ),
                             Row(children: [
                               Container(

                                 child: Text("description ",style: TextStyle( color: Colors.white,),
                                 ),alignment: Alignment.topLeft

                                 ,
                               )
                             ],)
                           ],
                         ),)
                       ],
                     )
                   ],
                 ),
               ),
             ),
           ),
           Container(
             width:  400,
             height:100,
             padding: EdgeInsets.all(10),
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               color: Colors.blue,
               child: Container(
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Container(
                           padding: EdgeInsets.only(left: 10,top: 10),
                           child: Text("Classic garage",
                             style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                           ),
                         ),
                         Spacer(flex: 2),
                         Container(
                           padding: EdgeInsets.only(right: 10,top: 10),
                           alignment:Alignment.topRight ,
                           child: Text("city",
                               style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                         ),
                       ],
                     ),
                     Row(
                       children: [
                         Container(

                           child: Image.asset(
                             'images/folder.png',
                             width: 100,
                             height: 100,
                           ),padding: EdgeInsets.all(8),
                         ),
                         Container(child: Column(
                           children: [
                             Row(
                               children: [
                                 Container(child: Text("Mechanical"),),
                                 Padding(
                                   padding: const EdgeInsets.only(left:80.0),
                                   child: Container(child: Text("200 Projects",
                                     style: TextStyle( color: Colors.white,),
                                     textAlign: TextAlign.right,),
                                     alignment: Alignment.topRight,),
                                 )
                               ],
                             ),
                             Row(children: [
                               Container(

                                 child: Text("description ",style: TextStyle( color: Colors.white,),
                                 ),alignment: Alignment.topLeft

                                 ,
                               )
                             ],)
                           ],
                         ),)
                       ],
                     )
                   ],
                 ),
               ),
             ),
           ),
           Container(
             width:  400,
             height:100,
             padding: EdgeInsets.all(10),
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               color: Colors.blue,
               child: Container(
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Container(
                           padding: EdgeInsets.only(left: 10,top: 10),
                           child: Text("Classic garage",
                             style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                           ),
                         ),
                         Spacer(flex: 2),
                         Container(
                           padding: EdgeInsets.only(right: 10,top: 10),
                           alignment:Alignment.topRight ,
                           child: Text("city",
                               style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                         ),
                       ],
                     ),
                     Row(
                       children: [
                         Container(

                           child: Image.asset(
                             'images/folder.png',
                             width: 100,
                             height: 100,
                           ),padding: EdgeInsets.all(8),
                         ),
                         Container(child: Column(
                           children: [
                             Row(
                               children: [
                                 Container(child: Text("Mechanical"),),
                                 Padding(
                                   padding: const EdgeInsets.only(left:80.0),
                                   child: Container(child: Text("200 Projects",
                                     style: TextStyle( color: Colors.white,),
                                     textAlign: TextAlign.right,),
                                     alignment: Alignment.topRight,),
                                 )
                               ],
                             ),
                             Row(children: [
                               Container(

                                 child: Text("description ",style: TextStyle( color: Colors.white,),
                                 ),alignment: Alignment.topLeft

                                 ,
                               )
                             ],)
                           ],
                         ),)
                       ],
                     )
                   ],
                 ),
               ),
             ),
           ),
           Container(
             width:  400,
             height:100,
             padding: EdgeInsets.all(10),
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15.0),
               ),
               color: Colors.blue,
               child: Container(
                 child: Column(
                   children: [
                     Row(
                       children: [
                         Container(
                           padding: EdgeInsets.only(left: 10,top: 10),
                           child: Text("Classic garage",
                             style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                           ),
                         ),
                         Spacer(flex: 2),
                         Container(
                           padding: EdgeInsets.only(right: 10,top: 10),
                           alignment:Alignment.topRight ,
                           child: Text("city",
                               style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
                         ),
                       ],
                     ),
                     Row(
                       children: [
                         Container(

                           child: Image.asset(
                             'images/folder.png',
                             width: 100,
                             height: 100,
                           ),padding: EdgeInsets.all(8),
                         ),
                         Container(child: Column(
                           children: [
                             Row(
                               children: [
                                 Container(child: Text("Mechanical"),),
                                 Padding(
                                   padding: const EdgeInsets.only(left:80.0),
                                   child: Container(child: Text("200 Projects",
                                     style: TextStyle( color: Colors.white,),
                                     textAlign: TextAlign.right,),
                                     alignment: Alignment.topRight,),
                                 )
                               ],
                             ),
                             Row(children: [
                               Container(

                                 child: Text("description ",style: TextStyle( color: Colors.white,),
                                 ),alignment: Alignment.topLeft

                                 ,
                               )
                             ],)
                           ],
                         ),)
                       ],
                     )
                   ],
                 ),
               ),
             ),
           ),

         ],
),
     );


Widget VerticalRecyclerView(BuildContext context,NetWork netWork)=>
    Container(
      alignment: Alignment.topCenter,
      width:  400,
     // height:180,
      child: FutureBuilder(
       future: netWork.getNearBy(),
        builder: (context,snapShot){
         if (snapShot.data!=null) {
           List<Data> list = snapShot.data;
           return ListView.builder(
             itemCount: list.length,
             itemBuilder: (context, index) {
               return Container(
                 width: 400,
                 //    height:100,
                 padding: EdgeInsets.all(10),
                 child: Card(
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(15.0),
                   ),
                   color: Colors.white,
                   child: Container(
                     child: Column(
                       children: [
                         Row(
                           children: [
                             Container(
                               padding: EdgeInsets.only(left: 10, top: 10),
                               child: Text(
                                 list[index].name,
                                 style: TextStyle(
                                     fontSize: 16,
                                     fontWeight: FontWeight.bold,
                                     color: Colors.black45),
                               ),
                             ),
                             Container(
                                 padding: EdgeInsets.only(top: 10),
                                 child: SmoothStarRating(
                                     allowHalfRating: false,
                                     onRated: (v) {},
                                     starCount: 5,
                                     rating: 5,
                                     size: 25.0,
                                     isReadOnly: true,
                                     filledIconData: Icons.star,
                                     color: Colors.amber,
                                     borderColor: Colors.amber,
                                     spacing: 0.0)),
                             Spacer(flex: 2),
                             Container(
                               padding: EdgeInsets.only(right: 10, top: 10),
                               alignment: Alignment.topRight,
                               child: Text("city",
                                   style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.bold,
                                       color: Colors.white)),
                             ),
                           ],
                         ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               child: ClipRRect(
                                 borderRadius: BorderRadius.circular(8.0),
                                 child: Image.network(
                                   'https://e-commerce-dev.intcore.net/uploads/products/MItqele2aABSzQ0Qf9aDiKiayL2RixiY6TCit5DK.jpeg',
                                   width: 100,
                                   height: 100,
                                 ),
                               ),
                               padding: EdgeInsets.all(8),
                             ),
                             Container(
                               padding: EdgeInsets.only(top: 10),
                               child: Column(
                                 children: [
                                   Container(
                                     child: Container(
                                       width: MediaQuery
                                           .of(context)
                                           .size
                                           .width - 154,
                                       child: Row(
                                         children: [
                                           Expanded(
                                               flex: 1,
                                               child: Text(
                                                 list[index].type,
                                                 style: TextStyle(
                                                     fontSize: 18,
                                                     color: Colors.blue),
                                               )),
                                           Text(
                                             list[index].projectNumber.counter
                                                 .toString(),
                                             style: TextStyle(
                                               color: Colors.black54,
                                               fontSize: 16,
                                             ),
                                             textAlign: TextAlign.right,
                                           )
                                         ],
                                       ),
                                     ),
                                   ),
                                   Row(
                                     children: [
                                       Container(
                                         //error is here
                                         //    child: Text("description ",style: TextStyle( color: Colors.white,),
                                       )
                                     ],
                                   )
                                 ],
                               ),
                             )
                           ],
                         )
                       ],
                     ),
                   ),
                 ),
               );
             },

           );
         }else {
           return CircularProgressIndicator();
         }
        },
      ),
    );

