import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/ui/IntroSlides.dart';
import 'package:flutterpractice/ui/MainScreens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:after_layout/after_layout.dart';
import 'package:firebase_core/firebase_core.dart';


import 'SignIn.dart';

class splashScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _SplashScreen();
  }
}
class _SplashScreen extends State<splashScreen>  {

  @override
  Widget build(BuildContext context)  {


    // TODO: implement build
    return Scaffold(body :
    Container(

     child: Image.asset("images/splashbackground.png"),
     foregroundDecoration: BoxDecoration(image: DecorationImage(
    image: Image.asset("images/logo.png").image,
      fit: BoxFit.contain,
    ),),

    ),

    );



  }

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4),
            ()=>checkFirstSeen(context)
            );
  }


  Future checkFirstSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    // print("seen"+_seen.toString());

    if (_seen==true) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new SignIn()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroSlides()));
      bool _seen = (prefs.getBool('seen'));
      //   print("seen"+_seen.toString());
    }
  }
}

