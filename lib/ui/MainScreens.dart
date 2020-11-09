
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/ui/SignIn.dart';

import 'Home.dart';
import 'Login.dart';

class _MainScreen extends State<MainScreen> {
  var _selectedIndex ;
  List<Widget> _Screens=[Home(),Login(),SignIn()];
  PageController _pageController=PageController();
  // void _onItemSelected (int selectedItem){
  //       setState(() {
  //     _selectedIndex = index;
  //     _pageController.animateToPage(index,
  //         duration: Duration(milliseconds: 300), curve: Curves.ease);
  //   })
  //   print(selectedItem);
  //   _pageController.jumpToPage(selectedItem);
  // }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
          body: PageView(
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
                  title: Text('Users'),
                  activeColor: Colors.white
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Messages'),
                  activeColor: Colors.white
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.settings),
                  title: Text('Settings'),
                  activeColor: Colors.white
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.notifications),
                  title: Text('Settings'),
                  activeColor: Colors.white
              )
            ],
          )
      ),
    );
  }
}
class MainScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainScreen();
  }

}