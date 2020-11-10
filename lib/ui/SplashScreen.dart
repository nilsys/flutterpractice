import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/ui/IntroSlides.dart';
import 'package:flutterpractice/ui/MainScreens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:after_layout/after_layout.dart';

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
    return MaterialApp(home : new SplashScreen(
        seconds: 3,
        routeName: "/",
        navigateAfterSeconds: new IntroSlides(),
        image: new Image.asset('images/logo.png'),
        imageBackground: Image.asset('images/splashbackground.png').image ,
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        useLoader: false,
    ),
      debugShowCheckedModeBanner: false

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

}

