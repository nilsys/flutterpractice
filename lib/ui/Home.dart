import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Model/NearbyResponse.dart';
import 'package:flutterpractice/component/MultiLine.dart';
import 'package:flutterpractice/home/HomeRepository.dart';
import 'package:flutterpractice/network/Network.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  var netWork=new Network();
  var homeRepository=HomeRepository();
  var token;
  @override
  Future<void> initState() {
    // TODO: implement initState
    super.initState();
   // SharedPreferences prefs =  SharedPreferences.getInstance();
   // token = (prefs.getString('Token'));
    //token ="eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjAxNWUyMTgxNzc2NjVkODUwZWYzZWQ0NWMyMTE5ZTBkMjQ1ZTZlMDlmMGI4NGM4OTYwMTBjMDlkODI1MjEzYTZjZDcwZjVkOGU1NDNjM2RhIn0.eyJhdWQiOiIxIiwianRpIjoiMDE1ZTIxODE3NzY2NWQ4NTBlZjNlZDQ1YzIxMTllMGQyNDVlNmUwOWYwYjg0Yzg5NjAxMGMwOWQ4MjUyMTNhNmNkNzBmNWQ4ZTU0M2MzZGEiLCJpYXQiOjE2MDUwODYxNTEsIm5iZiI6MTYwNTA4NjE1MSwiZXhwIjoxNjM2NjIyMTUxLCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.PV5Q9dxqcC8wBdfDYx8xCvondoi6j79IrvbDCuYufWZ7eXJ5LzC0HB1zR_uxYLgSLwLYY9i_n0wCsrast5d1BUoR2ODdW5wDu-Y11_uOX7q72Jvhc9MyJ7fK5l_0kDXegSrtMmh_8yeI5hbD4YoGbiwT0L-b1N2SvWrQOvtnyf347H18jB1FNoiuI87T_P_3RqPgMFCLgQkk0AHXrwdqeya25MuUsIKsiaKdl5fTKdWQLexyDXaQgyvZ2Ona5kbsC77avuRrX1x7XxYdQhIuZi3lYsN8ZoCyiFS9ry5Sm4QyO-8VCcgYv5FjOo8B1plm3uyVN7Snkjbf41hIA9nn89fXGqGRPOrVagsQMBlK-YTD6M0eIPODbCxIohWlEM0PeXNwAZyOOjHh068zXnQSaYYx7F_0ZxmOze8QbHxm1JmvDocrHeALGaWQpPce_8HGKxMLCerW5AvcZR4jxNdvG9RVSkPCvWdA499APKsEdRhJ2nh5HWOEA0ow-pF57K03VD8ubZ3CE8g7a-XsTsQJGOejVZoSYZe31X4snFl9Tehvi-0WkmoWPNiUwzSbyMUyyXv-6H8hOX9pnwtdnN_GB5gfOa4HufJB_5UXh6oa9IaNk0LB3sbncy5lS6-av3rWNl9XCgNLYtgEq-cNXPRE0GWBG-k5EYNUGPaaBPXwHoI";
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
            Container(child:  VerticalRecyclerView(context,homeRepository,token),height: 420,),
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
           height:150,
           padding: EdgeInsets.all(10),
         child: Card(
           shape: RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(15.0),
           ),
          color:  Color(0xff405A7B),
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

                        padding: EdgeInsets.all(10),

                    ),
                    Container(child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 14),
                                    child: Text(
                                      "Mechanical",
                                      style: TextStyle(
                                          color: Color(0xff29B2FE),
                                          fontSize: 16),
                                    ),
                                  ),

                                  Container(
                                      margin: EdgeInsets.only(top: 14),
                                      child: Text(
                                        "200 Projects",
                                        style: TextStyle(
                                            color: Color(0xff29B2FE),
                                            fontSize: 16),
                                      ))
                                ],
                              ),
                              Row(children: [


                          Container(
                        //error is here
                           child: Text("description ",style: TextStyle( color: Colors.white,)

                          )

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


Widget VerticalRecyclerView(BuildContext context,HomeRepository homeRepository,String token)=>
    Container(
      alignment: Alignment.topCenter,
      width:  400,
     // height:180,
      child: FutureBuilder<List<Provider>>(
       future: homeRepository.getNearby("users/lat/37.33233141/long/-122.0312186?page=1"),
        builder: (BuildContext context, AsyncSnapshot<List<Provider>> snapShot){
         if (snapShot.data!=null) {
           List<Provider> list = snapShot.data;
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
                                 margin: EdgeInsets.only(left: 10),
                                 padding: EdgeInsets.only(top: 10),
                                 child: SmoothStarRating(
                                     allowHalfRating: false,
                                     onRated: (v) {},
                                     starCount: 5,
                                     rating: double.parse(list[index].rates.toString()),
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
                                   list[index].avatar,
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
                                       MultiLine(list[index].description, 3, 150, Color(0xff888888))
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