import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Model/login/SignInSocial.dart';
import 'package:flutterpractice/auth/SignUpForm.dart';
import 'package:firebase_auth/firebase_auth.dart' as eos;


class SignUpType extends StatefulWidget{

  eos.User userDetails;
  User user;
  SignUpType({Key key, this.userDetails,this.user}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _SignUpType(userDetails,user);
  }

}

class _SignUpType extends State{
   eos.User userDetailsGoogle;
   User userDetailsFacebok;
   var type;
   _SignUpType(eos.User userDetails,User user){
        this.userDetailsGoogle=userDetails;
        this.userDetailsFacebok=user;

  }

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
             type="customer";
             Navigator.pushReplacement(
               context,
               MaterialPageRoute(builder: (context) => SignUpForm(userDetails: userDetailsGoogle,type: type,user: userDetailsFacebok,)),
             );
           }

           ),
         ),
         Container(
           child: GestureDetector(child: Image.asset('images/Workshop.png',height: 150),
           onTap: (){
             type="workshop";
           },),
           ),
       ],
     ),
   );
  }
}