import 'package:flutter/material.dart';
import 'package:flutterpractice/cache/AppCache.dart';
import 'package:flutterpractice/ui/SplashScreen.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppCache.instance.init().then((value) {
    runApp(MaterialApp(home:splashScreen(),debugShowCheckedModeBanner: false));
  });
}
