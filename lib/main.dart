import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/cache/AppCache.dart';
import 'package:flutterpractice/ui/SplashScreen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AppCache.instance.init().then((value)  {
    runApp(MaterialApp(home:splashScreen(),debugShowCheckedModeBanner: false));
  });
}
