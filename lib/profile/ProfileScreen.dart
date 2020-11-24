import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Model/login/UserResponse.dart';
import 'package:flutterpractice/auth/AuthRepository.dart';
import 'package:flutterpractice/auth/SignIn.dart';
import 'package:flutterpractice/cache/AppCache.dart';
import 'package:flutterpractice/cache/TokenCache.dart';
import 'package:flutterpractice/cache/UserCache.dart';
import 'package:flutterpractice/component/CardBox.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ProfileScreen();
  }

}
class _ProfileScreen extends State{

  var auth = AuthRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('');
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("My Profile")),
         body: Container(
          child: Column(
            children: [
            Container(
              margin: EdgeInsets.all(20.0),
              height: 150,
              width: double.infinity,
              //    decoration: new BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
              color: Colors.white,
              child: CardBox(
                Colors.white,
                4,
                Container(
                    child: Image.network(UserCache.instance.getUserImage())),
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
              height: 256,
              width: double.infinity,
              //   decoration: new BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
              color: Colors.white,
              child: CardBox(
                Colors.white,
                4,
                Container(
                    child: Column(
                  children: [
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 4),
                        Icon(Icons.account_circle_sharp),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          UserCache.instance.getUserName(),
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff405A7B)),
                        )
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 4),
                        Icon(Icons.mail_outline),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          UserCache.instance.getUserEmail(),
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff405A7B)),
                        )
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 4),
                        Icon(Icons.phone_android),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          UserCache.instance.getUserPhone(),
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff405A7B)),
                        )
                      ],
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 4),
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "cairo, egypt",
                          style:
                              TextStyle(fontSize: 18, color: Color(0xff405A7B)),
                        )
                      ],
                    ),
                  ],
                )),
              ),
            ),
            Container(
                width: double.infinity,
                height: 56,
                margin: EdgeInsets.only(
                    right: 10, left: 10, top: 10),
                child: RaisedButton(
                    onPressed: () {},
                    color: Colors.white,

                    child: Text(
                      'UPDATE',
                      style: TextStyle(
                          color:  Color(0xff29B2FE),
                          fontSize: 16),
                    ),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            8.0),
                        side: BorderSide(
                            color: Color(0xff29B2FE))
                    )
                )
                ,

              ),
            Container(
            width: double.infinity,
            height: 56,
            margin: EdgeInsets.only(
                right: 10, left: 10, top: 10),
            child: RaisedButton(
                onPressed: () {

                  logout();
                },
                color: Color(0xff29B2FE),

                child:  Text(
                  'LOGOUT',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0),
                    side: BorderSide(
                        color: Color(0xff29B2FE))
                )
            )
            ,

            ),
          ],
          ),
        )
      ),
    );

  }

  Widget buildList() {
  return Container(
     child: Column(
       children: [
    //     Container(
    //       height: 150,
    //
    //
    //    //   decoration: new BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
    //       color: Colors.white,
    //         child: CardBox(
    //         Colors.white,
    //         4,
    //         Container(
    //           child:Image.asset("images/splashbackground.png"),
    //         ),
    //       ),
    //     ),
      ],
     ),
  );
  }

  void logout() {
    var token = TokenCache.instance.getAccessToken();
    auth.logout("logout",{
      'Accept':'application/json',
      'Authorization': 'Bearer $token',
    }).then((value) {
      print("LogOutt"+value.message.toString());
      UserCache.instance.setUserCache(false);

      Navigator.of(context)
          .pushReplacement(
          new MaterialPageRoute(
              builder: (
                  context) =>
              new SignIn()));
    });

  }
}
