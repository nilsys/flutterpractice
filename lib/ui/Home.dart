import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Model/NearbyResponse.dart';
import 'package:flutterpractice/component/CardBox.dart';
import 'package:flutterpractice/component/MultiLine.dart';
import 'package:flutterpractice/home/HomeRepository.dart';
import 'package:flutterpractice/network/Network.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:pagination/pagination.dart';

class Home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _Home();
  }
}

class _Home extends State<Home>{
  var netWork=new Network();
  var homeRepository=HomeRepository();
  var token;
  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();

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
            WidgetHoriRecyclerView(context),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 12,top:10),
                child: Text("Nearby workshops",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),)),
            Expanded(child: Container(child:  VerticalRecyclerView(context,homeRepository,token),height: double.infinity,)),
        //    NewCard(context)
          ],
        )),
    );
  }

  Future<List<Provider>> pageFetch(int offset) async {
    double page= offset/10;
    NearbyResponse nearbyResponse= await homeRepository.getNearby("users/lat/37.33233141/long/-122.0312186?page=$page");
    if (nearbyResponse.provider!=null){
      //print(nearbyResponse.provi);
    if (nearbyResponse.provider[0].location!=null){
      print(nearbyResponse.provider[0].location.state);
    }
    }

    return nearbyResponse.provider ;
  }

  // Widget HorizentalRecyclerView () => Container(
  //   alignment: Alignment.topCenter,
  //   width:  340,
  //   height:180,
  //   child:
  //   ListView(
  //     scrollDirection: Axis.horizontal,
  //     children:<Widget> [
  //       Container(
  //      //   width:  400,
  //       //  height:150,
  //       //  padding: EdgeInsets.all(10),
  //         child: CardBox(
  //            Color(0xff405A7B),
  //           10,
  //           Container(
  //             child: Column(
  //               children: [
  //                 Row(
  //                   children: [
  //                     Container(
  //                       padding: EdgeInsets.only(left: 10,top: 10),
  //                       child: Text("Classic garage",
  //                         style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
  //                       ),
  //                     ),
  //                     Spacer(flex: 2),
  //                     Container(
  //                       padding: EdgeInsets.only(right: 10,top: 10),
  //                       alignment:Alignment.topRight ,
  //                       child: Text("city",
  //                           style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white)),
  //                     ),
  //                   ],
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.start,
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Container(
  //
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(8.0),
  //                         child: Image.network(
  //                           'https://e-commerce-dev.intcore.net/uploads/products/MItqele2aABSzQ0Qf9aDiKiayL2RixiY6TCit5DK.jpeg',
  //                           width: 100,
  //                           height: 100,
  //                         ),
  //                       ),
  //
  //                       padding: EdgeInsets.all(10),
  //
  //                     ),
  //                     Container(child: Column(
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Row(
  //                           children: [
  //                             Container(
  //                               margin: EdgeInsets.only(top: 14),
  //                               child: Text(
  //                                 "Mechanical",
  //                                 style: TextStyle(
  //                                     color: Color(0xff29B2FE),
  //                                     fontSize: 16),
  //                               ),
  //                             ),
  //
  //                             Container(
  //                                 margin: EdgeInsets.only(top: 14),
  //                                 child: Text(
  //                                   "200 Projects",
  //                                   style: TextStyle(
  //                                       color: Color(0xff29B2FE),
  //                                       fontSize: 16),
  //                                 ))
  //                           ],
  //                         ),
  //                         Row(children: [
  //
  //
  //                           Container(
  //                             //error is here
  //                               child: Text("description ",style: TextStyle( color: Colors.white,)
  //
  //                               )
  //
  //                           )
  //
  //
  //                         ],)
  //                       ],
  //                     ),)
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //
  //
  //     ],
  //   ),
  // );


  Widget VerticalRecyclerView(BuildContext context,HomeRepository homeRepository,String token)=>
      Container(
        alignment: Alignment.topCenter,
        width:  400,
         height:150,
        // child: FutureBuilder<List<Provider>>(
        //   future: homeRepository.getNearby("users/lat/37.33233141/long/-122.0312186?page=1"),
        //   builder: (BuildContext context, AsyncSnapshot<List<Provider>> snapShot){
        //     if (snapShot.data!=null) {
        //       List<Provider> list = snapShot.data;
        //       return
               child: PaginationList<Provider>(
                  separatorWidget: Container(
                  ),
                  itemBuilder: (BuildContext context, Provider response) {
                     return Container(
                      width: 400,
                      height:150,
                      padding: EdgeInsets.only(right: 10,left: 10,top: 4,bottom: 2),
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
                                      response.name,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 10),
                                      padding: EdgeInsets.only(top: 10),
                                      child: SmoothStarRating(
                                          allowHalfRating: false,
                                          onRated: (v) {},
                                          starCount: 5,
                                          rating: double.parse( response.rates.toString()),
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
                                    height: 84,
                                    width: 84,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        response.avatar,
                                        width: 100,
                                        height: 100,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(8),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
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
                                                      response.type,
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          color: Colors.blue),
                                                    )),
                                                Text(
                                                  response.projectNumber.counter
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
                                            MultiLine( response.description, 3, 150, Color(0xff888888))
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
                  pageFetch: pageFetch,

                  onError: (dynamic error) => Center(
                    child: Text('Something Went Wrong $error'),
                  ),

                  onEmpty: Center(
                    child: Text('Empty List'),
                  ),
                )

      );
              // return ListView.builder(
              //   itemCount: list.length,
              //   itemBuilder: (context, index) {
              //
              // return Container(
              //   width: 400,
              //   //    height:100,
              //   padding: EdgeInsets.all(10),
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(15.0),
              //     ),
              //     color: Colors.white,
              //     child: Container(
              //       child: Column(
              //         children: [
              //           Row(
              //             children: [
              //               Container(
              //                 padding: EdgeInsets.only(left: 10, top: 10),
              //                 child: Text(
              //                   list[index].name,
              //                   style: TextStyle(
              //                       fontSize: 16,
              //                       fontWeight: FontWeight.bold,
              //                       color: Colors.black45),
              //                 ),
              //               ),
              //               Container(
              //                   margin: EdgeInsets.only(left: 10),
              //                   padding: EdgeInsets.only(top: 10),
              //                   child: SmoothStarRating(
              //                       allowHalfRating: false,
              //                       onRated: (v) {},
              //                       starCount: 5,
              //                       rating: double.parse(list[index].rates.toString()),
              //                       size: 25.0,
              //                       isReadOnly: true,
              //                       filledIconData: Icons.star,
              //                       color: Colors.amber,
              //                       borderColor: Colors.amber,
              //                       spacing: 0.0)),
              //               Spacer(flex: 2),
              //               Container(
              //                 padding: EdgeInsets.only(right: 10, top: 10),
              //                 alignment: Alignment.topRight,
              //                 child: Text("city",
              //                     style: TextStyle(
              //                         fontSize: 16,
              //                         fontWeight: FontWeight.bold,
              //                         color: Colors.white)),
              //               ),
              //             ],
              //           ),
              //           Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Container(
              //                 child: ClipRRect(
              //                   borderRadius: BorderRadius.circular(8.0),
              //                   child: Image.network(
              //                     list[index].avatar,
              //                     width: 100,
              //                     height: 100,
              //                   ),
              //                 ),
              //                 padding: EdgeInsets.all(8),
              //               ),
              //               Container(
              //                 padding: EdgeInsets.only(top: 10),
              //                 child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.start,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Container(
              //                       child: Container(
              //                         width: MediaQuery
              //                             .of(context)
              //                             .size
              //                             .width - 154,
              //                         child: Row(
              //                           children: [
              //                             Expanded(
              //                                 flex: 1,
              //                                 child: Text(
              //                                   list[index].type,
              //                                   style: TextStyle(
              //                                       fontSize: 18,
              //                                       color: Colors.blue),
              //                                 )),
              //                             Text(
              //                               list[index].projectNumber.counter
              //                                   .toString(),
              //                               style: TextStyle(
              //                                 color: Colors.black54,
              //                                 fontSize: 16,
              //                               ),
              //                               textAlign: TextAlign.right,
              //                             )
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                     Row(
              //                       children: [
              //                         MultiLine(list[index].description, 3, 150, Color(0xff888888))
              //                       ],
              //                     )
              //                   ],
              //                 ),
              //               )
              //             ],
              //           )
              //         ],
              //       ),
              //     ),
              //   ),
              // );

            // }else {
            //   return CircularProgressIndicator();
            // }


  WidgetHoriRecyclerView(BuildContext context)=>
      Container(
          alignment: Alignment.topCenter,
          width: double.infinity,
          height: 150 ,
          child: PaginationList<Provider>(
            scrollDirection: Axis.horizontal,
            separatorWidget: Container(
            ),
            itemBuilder: (BuildContext context, Provider response) {
              return Container(
                width: 350,
                height:150,
                padding: EdgeInsets.only(right: 10,left: 10,top: 4,bottom: 2),
                child: CardBox(
                  Color(0xff405A7B),
                  10,
                  Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10, top: 10),
                              child: Text(
                                response.name,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),

                          Spacer(flex: 1),
                            Container(
                              padding: EdgeInsets.only(right: 10, top: 10),
                              alignment: Alignment.topRight,
                              child: Text(response.name??'ccc',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xffEEEEEE))),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 84,
                              width: 84,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  response.avatar,
                                  width: 100,
                                  height: 100,
                                ),
                              ),
                              padding: EdgeInsets.all(8),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Container(
                                      child: Row(
                                        children: [
                                          Text(
                                            response.type,
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.blue),
                                          ),
                                          Container(
                                            child: Text(
                                              response.projectNumber.counter
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                              textAlign: TextAlign.right,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      MultiLine(response.description, 3, 150, Color(0xffFCFCFC))
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
            pageFetch: pageFetch,

            onError: (dynamic error) => Center(

              child: Text('Something Went Wrong '),
            ),

            onEmpty: Center(
              child: Text('Empty List'),
            ),
          )

      );


}





