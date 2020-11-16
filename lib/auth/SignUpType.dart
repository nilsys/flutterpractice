import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/auth/SignUpForm.dart';
import 'package:flutterpractice/component/CardBox.dart';




class SignUp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignUp();
  }

}

class _SignUp extends State{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     body: Column(
       children: [
         Container(
           padding: EdgeInsets.only(top: 20),
           child: Image.asset('images/signup.png',height: 188,width: 263,),
         ),
         Container(
          margin: EdgeInsets.only(right: 33,left: 33),
          child: Divider(
            thickness: 4,
            color: Color(0xff29B2FE),
          ),
        ),
         Container(
           alignment: Alignment.topLeft,
           padding: EdgeInsets.only(left: 20),
           child: Text("SIGN UP AS",style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
         ),
         Container(
           child: GestureDetector(child: FittedBox(child: Image.asset('images/client.png',height: 150,),fit: BoxFit.fill,),
           onTap:(){
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) => SignUpForm()),
             );
           }


           ),
         ),
         Container(
           child: Image.asset('images/Workshop.png',height: 150),
           ),
       ],
     ),
   );
  }



}