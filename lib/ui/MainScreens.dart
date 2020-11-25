
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/garage/ui/Garage.dart';
import 'package:flutterpractice/setting/Setting.dart';
import 'file:///C:/Users/intcore-013/AndroidStudioProjects/flutterpractice/lib/profile/ui/ProfileScreen.dart';
import 'package:flutterpractice/ui/ClassicGarage.dart';

import '../home/Home.dart';
import 'Login.dart';
import '../auth/SignIn.dart';

class _MainScreen extends State<MainScreens> {
  var _selectedIndex ;
  List<Widget> _Screens=[Home(),Garage(),ProfileScreen(),Setting()];
  PageController _pageController=PageController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            children: _Screens,
            controller: _pageController ,
          ),
          bottomNavigationBar:BottomNavyBar(
            backgroundColor: Colors.blue,
            selectedIndex: _selectedIndex,
            showElevation: true, // use this to remove appBar's elevation
            itemCornerRadius: 4,
            onItemSelected: (index) => setState(() {
              _selectedIndex = index;
              _pageController.animateToPage(index,
                  duration: Duration(milliseconds: 300), curve: Curves.ease);
            })  ,
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                inactiveColor: Colors.white,
                title: Text('Home'),
                activeColor: Colors.white,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.home_work),
                  title: Text('Garage'),
                  activeColor: Colors.white
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                  activeColor: Colors.white
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                  activeColor: Colors.white
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text('Notification'),
                  activeColor: Colors.white
              )
            ],
          )
      ),
    );
  }
}
class MainScreens extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreen();
  }

}