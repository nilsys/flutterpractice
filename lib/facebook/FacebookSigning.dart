import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutterpractice/Model/FacebookJson.dart';
import 'package:flutterpractice/Model/login/SignInSocial.dart';
import 'package:flutterpractice/auth/AuthRepository.dart';
import 'package:flutterpractice/auth/SignUpType.dart';
import 'package:flutterpractice/cache/TokenCache.dart';
import 'package:flutterpractice/cache/UserCache.dart';
import 'package:flutterpractice/google/GoogleSignIn.dart';
import 'package:firebase_auth/firebase_auth.dart' as eos;
import 'package:flutterpractice/ui/MainScreens.dart';

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
    logout();
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
            'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email,picture.height(200)&access_token=${facebookLoginResult
                .accessToken.token}');
        final FacebookAccessToken accessToken = facebookLoginResult.accessToken;
        var userId = accessToken.userId;


        var user = json.decode(graphResponse.body);
        FacebookResponse facebookResponse = FacebookResponse.fromJson(user);


        User profile = User();
        profile.name = facebookResponse.name;
        // profile.id = userId as int  ;
        profile.email = facebookResponse.email;
        var auth=AuthRepository();  
        if (userId != null) {
          print('userID'+userId);
          auth..signInSocial("social-login",
              {
                'Accept':'application/json',
                'Content-Type': 'application/json',
              },
              {
                'social_id': userId,
                'social_type': "facebook",
              }).then((value)   {

             saveUserData(value);
             Navigator.of(context).push(new MaterialPageRoute(builder: (context) => new MainScreens()));

                 }).catchError((Object error) {
            Navigator.of(context)
                .push(
                new MaterialPageRoute(
                    builder: (context) =>
                    new SignUpType(user: profile)));

            onLoginStatusChanged(true, profileData: profile);

          });

        break;

        }
    }

    _displayUserData(profileData) {
      return
        Column(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 80.0, bottom: 70.0),
                height: 160.0,
                width: 160.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      profileData['picture']['data']['url'],),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                      color: Colors.blue, width: 5.0),
                  borderRadius: BorderRadius.all(
                      const Radius.circular(80.0)),
                ),
              ),
            ),
            Text(
              "Logged in as: ${profileData['name']}",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
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


  }
  void  logout()  async {
    await facebookLogin.logOut();
    onLoginStatusChanged(false);
    print("Logged out");
  }
  void saveUserData(SignInSocial value){
    print('tokeninFacebook    '+value.token);
    TokenCache.instance.setAccessToken(value.token);
    UserCache.instance.setUserCache(true);
    UserCache.instance.setUserType(value.user.type);
    UserCache.instance.setUserImage(value.user.avatar);
    UserCache.instance.setUserName(value.user.name);
    UserCache.instance.setUserPhone(value.user.mobile);
    UserCache.instance.setUserEmail(value.user.email);
  }
}