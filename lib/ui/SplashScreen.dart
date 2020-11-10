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
  Future checkFirstSeen(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen')?? false);

    print("oooo"+_seen.toString());

    if (_seen==true) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MainScreen()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new IntroSlides()));
      bool _seen = (prefs.getBool('seen'));
      print("oooo2"+_seen.toString());

    }
  }
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
//    checkFirstSeen(context);
  }

}

