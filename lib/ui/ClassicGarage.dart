import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/component/CardBox.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ClassicGarage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ClassicGarage();
  }


}

class _ClassicGarage extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
      return SafeArea(
        child: Scaffold(
          body: Container(
           child: Column(
             children: [

            Container(
            margin: EdgeInsets.only(left: 20,right: 20,top: 20),
            child: CardBox(
              Colors.white,
              10,
              Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                child: Image.asset("images/logo.png",height: 150)),
              )
            ),
            Container(
              margin: EdgeInsets.only(left: 20,top: 10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      Text("Classic garage",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      Container(
                          child: SmoothStarRating(
                              allowHalfRating: false,
                              onRated: (v) {},
                              starCount: 4,
                              rating: 5,
                              size: 25.0,
                              isReadOnly: true,
                              filledIconData: Icons.star,
                              color: Colors.amber,
                              borderColor: Colors.amber,
                              spacing: 0.0)),

                    ],
                  ),
                  Spacer(flex: 2),
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: RaisedButton.icon(
                        onPressed: () {


                        },
                        color: Color(0xff29B2FE),
                        label: Text(
                          'Chat',
                          style: TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                        icon: Image.asset(
                          "images/chat.png", height: 17,
                          width: 17,),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: BorderSide(color: Color(0xff29B2FE))
                        )
                    ),
                  )


                ],
              ),

            ),
            Container(

              child: CardBox(
                Colors.white,
                15,
                Container(child: Column(
                  children: [
                    TextIcon("folder.png", "asdasd"),
                    Container(
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: Border.all(
                          color: Colors.red,
                          width: 8.0,
                        )
                      ),
                      child: const Text('RGB', textAlign: TextAlign.center),
                    )

                  ],
                ))
              ),
            )

             ],
           ),
          ),
        ),
      );
  }

}
Widget TextIcon(String imageName,String text){

 return Row(children: [
    Container(child: Image.asset("images/$imageName",height: 16,width: 16,)),
    Container(
      padding: EdgeInsets.only(left: 10),
      child: Text(text,style: TextStyle(fontSize: 16)))
  ],);
}