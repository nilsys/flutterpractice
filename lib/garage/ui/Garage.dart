import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/component/CardBox.dart';
import 'package:flutterpractice/core/AppColor.dart';

class Garage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _Garage();
  }

}
class _Garage extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return SafeArea(
     child: Scaffold(
       appBar: AppBar(title: Text("My Garage"),),
       body: Container(
         margin: EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04,right:MediaQuery.of(context).size.width*0.04),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             //text
             Container(
               margin: EdgeInsets.all(10),
               child: Text("What do you want to do?",style: TextStyle(fontSize: 18),),),
             //two buttons
             Container(
             child: Row(
               children: [
               SizedBox(width:MediaQuery.of(context).size.width*0.04),
               Expanded(
                 child: Container(
                   height: MediaQuery.of(context).size.height/15,
                   child: RaisedButton.icon(
                       onPressed: () {},
                       color: AppColor.white,
                       label: Text(
                         'Add Car',
                         style: TextStyle(
                             color: AppColor.darkBlue,
                             fontSize: 16),
                       ),
                       icon: Image.asset(
                         "images/car.png", height: 30, color: AppColor.darkBlue,
                         width: 30,),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(
                               8.0),
                           side: BorderSide(
                               color: AppColor.blue)
                       )
                   ),
                 ),
               ),
               SizedBox(width:MediaQuery.of(context).size.width*0.06),
               Expanded(
                 child: Container(
                   height: MediaQuery.of(context).size.height/15,
                   child: RaisedButton.icon(
                       onPressed: () {
                       },
                       color: AppColor.blue,
                       label: Text(
                         'Add Project',
                         style: TextStyle(
                             color: AppColor.white,
                             fontSize: 16),
                       ),
                       icon: Container(
                         color: AppColor.white,
                         child: Image.asset(
                           "images/project.png", height: 30,
                           width: 30,),
                       )
                       ,
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(
                               8.0),
                           side: BorderSide(
                               color: AppColor.blue)
                       )
                   ),
                 ),
               ),
              SizedBox(width:MediaQuery.of(context).size.width*0.04)
             ],),),
             SizedBox(height: 10),
             //two button
             Container(child: CardBox(AppColor.white,4,Container(
                 child:Row(
                     children: [
                       SizedBox(width:MediaQuery.of(context).size.width*0.04),
                       Expanded(
                         child: Container(
                           height: MediaQuery.of(context).size.height/15,
                           child: RaisedButton(
                             elevation: 0,
                               onPressed: () {},
                               color: AppColor.white,
                               child: Text(
                                 'My Cars',
                                 style: TextStyle(
                                     color: AppColor.gray,
                                     fontSize: 16),
                               ),
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(
                                       8.0),
                                   side: BorderSide(
                                       color: AppColor.white)
                               )
                           ),
                         ),
                       ),
                       SizedBox(width:MediaQuery.of(context).size.width*0.04),
                       Expanded(
                         child: Container(
                           height: MediaQuery.of(context).size.height/15,
                           child: RaisedButton(
                               onPressed: () {
                               },
                               color: AppColor.gray,
                               child: Text(
                                 'My Project',
                                 style: TextStyle(
                                     color: AppColor.black,
                                     fontSize: 16),
                               ),
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(
                                       8.0),
                                   // side: BorderSide(
                                   //     color: AppColor.blue)
                               )
                           ),
                         ),
                       ),
                       SizedBox(width:MediaQuery.of(context).size.width*0.04)
                     ],)



               )),),

           ],
         ),
       ),
     ),
   );
  }

  // Widget VerticalRecyclerView(BuildContext context,String token)=>
  //     Container(
  //         alignment: Alignment.topCenter,
  //         width:  400,
  //         height:150,
  //         // child: FutureBuilder<List<Provider>>(
  //         //   future: homeRepository.getNearby("users/lat/37.33233141/long/-122.0312186?page=1"),
  //         //   builder: (BuildContext context, AsyncSnapshot<List<Provider>> snapShot){
  //         //     if (snapShot.data!=null) {
  //         //       List<Provider> list = snapShot.data;
  //         //       return
  //         child: PaginationList<Provider>(
  //           separatorWidget: Container(
  //           ),
  //           itemBuilder: (BuildContext context, Provider response) {
  //             return Container(
  //               width: 400,
  //               height:150,
  //               padding: EdgeInsets.only(right: 10,left: 10,top: 4,bottom: 2),
  //               child: Card(
  //                 shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(15.0),
  //                 ),
  //                 color:AppColor.white,
  //                 child: Container(
  //                   child: Column(
  //                     children: [
  //                       Row(
  //                         children: [
  //                           Container(
  //                             padding: EdgeInsets.only(left: 10, top: 10),
  //                             child: Text(
  //                               response.name,
  //                               style: TextStyle(
  //                                   fontSize: 16,
  //                                   fontWeight: FontWeight.bold,
  //                                   color: AppColor.black),
  //                             ),
  //                           ),
  //                           Spacer(flex: 2),
  //                           Container(
  //                             padding: EdgeInsets.only(right: 10, top: 10),
  //                             alignment: Alignment.topRight,
  //                             child: Text("city",
  //                                 style: TextStyle(
  //                                     fontSize: 16,
  //                                     fontWeight: FontWeight.bold,
  //                                     color: AppColor.white)),
  //                           ),
  //                         ],
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.start,
  //                         crossAxisAlignment: CrossAxisAlignment.start,
  //                         children: [
  //                           Container(
  //                             height: 84,
  //                             width: 84,
  //                             child: ClipRRect(
  //                               borderRadius: BorderRadius.circular(8.0),
  //                               child: Image.network(
  //                                 response.avatar,
  //                                 width: 100,
  //                                 height: 100,
  //                               ),
  //                             ),
  //                             padding: EdgeInsets.all(8),
  //                           ),
  //                           Container(
  //                             padding: EdgeInsets.only(top: 10),
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               crossAxisAlignment: CrossAxisAlignment.start,
  //                               children: [
  //                                 Container(
  //                                   child: Container(
  //                                     width: MediaQuery
  //                                         .of(context)
  //                                         .size
  //                                         .width - 154,
  //                                     child: Row(
  //                                       children: [
  //                                         Expanded(
  //                                             flex: 1,
  //                                             child: Text(
  //                                               response.type,
  //                                               style: TextStyle(
  //                                                   fontSize: 18,
  //                                                   color: AppColor.blue),
  //                                             )),
  //                                         Text(
  //                                           response.projectNumber.counter
  //                                               .toString(),
  //                                           style: TextStyle(
  //                                             color: AppColor.black,
  //                                             fontSize: 16,
  //                                           ),
  //                                           textAlign: TextAlign.right,
  //                                         )
  //                                       ],
  //                                     ),
  //                                   ),
  //                                 ),
  //                                 Row(
  //                                   children: [
  //                                     MultiLine( response.description, 3, 150, AppColor.gray)
  //                                   ],
  //                                 )
  //                               ],
  //                             ),
  //                           )
  //                         ],
  //                       )
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //             );
  //
  //           },
  //         //  pageFetch: pageFetch,
  //
  //           onError: (dynamic error) => Center(
  //             child: Text('Something Went Wrong $error'),
  //           ),
  //
  //           onEmpty: Center(
  //             child: Text('Empty List'),
  //           ),
  //         )
  //
  //     );

}