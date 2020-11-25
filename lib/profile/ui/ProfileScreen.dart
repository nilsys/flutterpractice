import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Model/login/UserResponse.dart';
import 'package:flutterpractice/auth/AuthRepository.dart';
import 'package:flutterpractice/auth/SignIn.dart';
import 'package:flutterpractice/cache/TokenCache.dart';
import 'package:flutterpractice/cache/UserCache.dart';
import 'package:flutterpractice/component/CardBox.dart';
import 'package:flutterpractice/core/AppColor.dart';
import 'package:flutterpractice/profile/blocks/ProfileBlock.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProfileScreenState();
  }
}
class ProfileScreenState extends State<ProfileScreen> {
  var auth = AuthRepository();
  final bloc = Profilebloc();

  @override
  void initState() {
    bloc.fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: Text("My Profile")),
      body: Container(
        child: StreamBuilder<User>(
            stream: bloc.userController.stream,
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              if(snapshot.hasError) return Text("error");
              if(!snapshot.hasData) return Text("empty");
                return buildList(snapshot.data);
            }),
      ),
    ));
  }

  Widget buildList(User snapshot) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20.0),
            height: 150,
            width: double.infinity,
            //    decoration: new BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
            color: AppColor.white,
            child: CardBox(
              AppColor.white,
              4,
              Container(child: Image.network(snapshot.avatar)),
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            height: 256,
            width: double.infinity,
            //   decoration: new BoxDecoration(borderRadius: BorderRadius.circular(4.0)),
            color: AppColor.white,
            child: CardBox(
              AppColor.white,
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
                        snapshot.name,
                        style:
                            TextStyle(fontSize: 18, color: AppColor.darkBlue),
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
                        snapshot.email,
                        style:
                            TextStyle(fontSize: 18, color:AppColor.darkBlue),
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
                        snapshot.mobile,
                        style:
                            TextStyle(fontSize: 18, color: AppColor.darkBlue),
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
                      // Text(snapshot.location.address??'',
                      //   style:
                      //       TextStyle(fontSize: 18, color: AppColor.darkBlue),
                      // )
                    ],
                  ),
                ],
              )),
            ),
          ),
          Container(
            width: double.infinity,
            height: 56,
            margin: EdgeInsets.only(right: 10, left: 10, top: 10),
            child: RaisedButton(
                onPressed: () {},
                color: AppColor.white,
                child: Text(
                  'UPDATE',
                  style: TextStyle(color: AppColor.blue, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: AppColor.blue))),
          ),
          Container(
            width: double.infinity,
            height: 56,
            margin: EdgeInsets.only(right: 10, left: 10, top: 10),
            child: RaisedButton(
                onPressed: () {
                  logout();
                },
                color:AppColor.blue,
                child: Text(
                  'LOGOUT',
                  style: TextStyle(color: AppColor.white, fontSize: 16),
                ),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    side: BorderSide(color: AppColor.blue))),
          ),
        ],
      ),
    );
  }

  var padding = EdgeInsets.only(right: 10, left: 10, top: 10);

  void logout() {
    var token = TokenCache.instance.getAccessToken();
    auth.logout("logout", {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    }).then((value) {
      print("LogOutt" + value.message.toString());
      UserCache.instance.setUserCache(false);

      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new SignIn()));
    });
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }
}