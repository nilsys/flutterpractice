import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:flutterpractice/Model/FacebookJson.dart';
import 'package:flutterpractice/Model/login/SignInSocial.dart';
import 'package:flutterpractice/auth/SignUpType.dart';
import 'package:flutterpractice/google/GoogleSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart' as eos;

import 'package:http/http.dart' as http;

// class FacebookSigning extends StatefulWidget {
//   @override
//   _FacebookSigning createState() => _FacebookSigning();
// }

class FacebookSigning {
  bool isLoggedIn = false;
  bool isLoading = false;
  var profileData;

  var facebookLogin = FacebookLogin();

  void onLoginStatusChanged(bool isLoggedIn, {profileData}) {

      isLoading = false;
      this.isLoggedIn = isLoggedIn;
      this.profileData = profileData;

  }




  void initiateFacebookLogin(BuildContext context) async {
      isLoading = true;
    var facebookLoginResult =
    await facebookLogin.logIn(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.cancelledByUser:
        onLoginStatusChanged(false);
        break;
      case FacebookLoginStatus.loggedIn:
        var graphResponse = await http.get(
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult.accessToken.token}');
       final FacebookAccessToken accessToken = facebookLoginResult.accessToken;
       var userId = accessToken.userId;


        var  user = json.decode(graphResponse.body);
        FacebookResponse facebookResponse=FacebookResponse.fromJson(user);
        print("fffffffff"+user.toString());


        User profile = User();
        profile.name=facebookResponse.name;
       // profile.id = userId as int  ;
        profile.email = facebookResponse.email;



        Navigator.of(context)
            .push(
            new MaterialPageRoute(
                builder: (context) =>
                new SignUpType(user : profile)));

        onLoginStatusChanged(true, profileData: profile);
        break;
    }
  }

  _displayUserData(profileData) {
    return
      Column(
        children: <Widget>[
          Center(
            child:  Container(
              margin: EdgeInsets.only(top: 80.0,bottom: 70.0),
              height: 160.0,
              width: 160.0,
              decoration:  BoxDecoration(
                image:  DecorationImage(
                  image:  NetworkImage(
                    profileData['picture']['data']['url'],),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                    color: Colors.blue, width: 5.0),
                borderRadius:  BorderRadius.all(
                    const Radius.circular(80.0)),
              ),
            ),
          ),
          Text(
            "Logged in as: ${profileData['name']}",
            style:  TextStyle(
                color: Colors.blue, fontSize: 20.0, fontWeight: FontWeight.bold),
          ),

        ],
      );
  }

  _displayLoginButton() {
    return RaisedButton(
      child: Text(
        "Login with Facebook",
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
    //  onPressed: () => initiateFacebookLogin(),
    );
  }

  _logout() async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }
}
