import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/intcore-013/AndroidStudioProjects/flutterpractice/lib/core/Validation.dart';
import 'package:flutterpractice/auth/SignUpType.dart';
import 'package:flutterpractice/cache/AppCache.dart';
import 'package:flutterpractice/cache/TokenCache.dart';
import 'package:flutterpractice/cache/UserCache.dart';
import 'package:flutterpractice/component/CardBox.dart';
import 'package:flutterpractice/core/AppColor.dart';
import 'package:flutterpractice/facebook/FacebookSigning.dart';
import 'package:flutterpractice/google/GoogleSignIn.dart';
import 'package:flutterpractice/network/Network.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ui/MainScreens.dart';
import 'AuthRepository.dart';


class SignIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignIn();
  }

}

class _SignIn extends State<SignIn> {

  var validation = Validation();
  var network = Network();
  var auth = AuthRepository();
  var gSignIn = GoogleLogin();
  var facebook = FacebookSigning();
  final _formKey = GlobalKey<FormState>();
  var email, password;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkUser(context);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Builder(
          builder: (context) =>
              SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                        child: Image.asset("images/login.png", height:MediaQuery.of(context).size.height/6)
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 33, right: 33),
                      child: Divider(
                          thickness: 4,
                          color: AppColor.blue
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "LOGIN", style: TextStyle(color: AppColor.darkBlue,
                            fontSize: 32,
                            fontWeight: FontWeight.bold),)),
                    Container(
                      margin: EdgeInsets.only(top: 17, left: 20, right: 10),
                      child: CardBox(AppColor.white, 10, Container(
                        child: Column(
                          children: [
                            Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        //bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);


                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        if (!validation.isEmail(value)) {
                                          return 'Invalid Email';
                                        }

                                        return null;
                                      },
                                      controller: emailController

                                      ,
                                      decoration: new InputDecoration(
                                        hintText: 'email',
                                        prefixIcon: Icon(Icons.email_outlined),
                                      ),
                                    ),
                                    SizedBox(height:MediaQuery.of(context).size.height/50),
                                    TextFormField(
                                      obscureText: true,
                                      // The validator receives the text that the user has entered.
                                      validator: (value) {
                                        if (value.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        if (!validation.validateStructure(
                                            value)) {
                                          return "password must contain lower and upper character";
                                        }
                                        return null;
                                      },
                                      controller: passwordController,
                                      decoration: new InputDecoration(
                                        hintText: 'password',
                                        prefixIcon: Icon(Icons.lock),
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topRight,
                                      padding: EdgeInsets.only(
                                          top: 18, right: 16),
                                      child: Text(
                                        "Forget Password",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: AppColor.darkBlue),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height/15,
                                      margin: EdgeInsets.only(
                                          right: 10, left: 10, top: 20),
                                      child:
                                      RaisedButton(
                                        onPressed: () async {
                                          // Validate returns true if the form is valid, otherwise false.
                                          if (_formKey.currentState.validate()) {
                                            // If the form is valid, display a snackbar. In the real world,
                                            // you'd often call a server or save the information in a database.

                                            await network
                                                .login(emailController.text,
                                                passwordController.text)
                                                .then((value) async {
                                              SharedPreferences prefs =
                                              await SharedPreferences
                                                  .getInstance();
                                              //
                                              // TokenCache.instance.setAccessToken(value.token);
                                              // UserCache.instance.setUserCache(true);
                                              // UserCache.instance.setUserType(value.user.type);
                                              // UserCache.instance.setUserImage(value.user.avatar);
                                              // UserCache.instance.setUserName(value.user.name);
                                              // UserCache.instance.setUserPhone(value.user.mobile);
                                              // UserCache.instance.setUserEmail(value.user.email);
                                              UserCache.instance.setUser(value);

                                             // UserCache.instance.setUserlocation(value.user.location.address);
                                              if (value.user.type ==
                                                  "serviceProvider") {
                                                print('ServiceProvider');
                                              } else if (value.user.type == "customer") {
                                                //go to client home
                                                Navigator.of(context)
                                                    .pushReplacement(
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                        new MainScreens()));
                                              }
                                            }).catchError((Object error) {});
                                          }
                                        },
                                        child: Text('Login',style: TextStyle(fontSize: 16)),
                                        color: AppColor.blue,
                                      ),
                                    ),
                                    Container(
                                      width:  MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height/15,
                                      margin: EdgeInsets.only(
                                          right: 10, left: 10, top: 10),
                                      child: RaisedButton.icon(
                                          onPressed: () {

                                            facebook.initiateFacebookLogin(context);






                                          },
                                          color: AppColor.white,

                                          label: Text(
                                            'Sign in with Facebook',
                                            style: TextStyle(
                                                color: AppColor.blue,
                                                fontSize: 16),
                                          ),
                                          icon: Image.asset(
                                            "images/facebook.png", height: 30,
                                            width: 30,)
                                          ,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  8.0),
                                              side: BorderSide(
                                                  color: AppColor.blue)
                                          )
                                      )
                                      ,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: MediaQuery.of(context).size.height/15,
                                      margin: EdgeInsets.only(
                                          right: 10, left: 10, top: 10),
                                      child: RaisedButton.icon(
                                          onPressed: () async {

                                            await gSignIn.signIn(context).then((userDetails) async {
                                              if (userDetails.uid != null) {
                                                await auth.signInSocial("social-login",
                                                    {
                                                      'Accept':'application/json',
                                                      'Content-Type': 'application/json',
                                                    },
                                                    {
                                                      'social_id': userDetails.uid,
                                                      'social_type': "google",
                                                    }).then((loginGoogle) {
                                                    if ( loginGoogle.user!=null) {
                                                    // TokenCache.instance.setAccessToken(loginGoogle.token);
                                                    // UserCache.instance.setUserCache(true);
                                                    // UserCache.instance.setUserType(loginGoogle.user.type);
                                                    // UserCache.instance.setUserImage(loginGoogle.user.avatar);
                                                    // UserCache.instance.setUserName(loginGoogle.user.name);
                                                    // UserCache.instance.setUserPhone(loginGoogle.user.mobile);
                                                    // UserCache.instance.setUserEmail(loginGoogle.user.email);
                                                    UserCache.instance.setUser(loginGoogle);

                                                        if (loginGoogle.user.type == "serviceProvider") {}
                                                        else if (loginGoogle.user.type == "customer") {
                                                          //go to client home

                                                          Navigator.of(context)
                                                              .pushReplacement(
                                                              new MaterialPageRoute(
                                                                  builder: (
                                                                      context) =>
                                                                  new MainScreens()));
                                                        }
                                                      }
                                                    }).catchError((Object error) {
                                                  onErrorGoogle(userDetails);
                                                });

                                              }
                                            },onError: (error){

                                            });
                                          },
                                          color: AppColor.white,
                                          label: Text(
                                            'Sign in with Google',
                                            style: TextStyle(
                                                color: AppColor.red,
                                                fontSize: 16),
                                          ),
                                          icon: Image.asset(
                                            "images/google.png", height: 30,
                                            width: 30,),
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(
                                                  8.0),
                                              side: BorderSide(
                                                  color: AppColor.blue)
                                          )
                                      ),

                                    ),
                                  ],
                                )
                            )
                          ],),
                      )),),
                    Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height/15,
                        margin: EdgeInsets.only(
                            right: 10, left: 10, top: 10),
                        child:
                        RaisedButton(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.

                              Navigator.of(context)
                                  .push(
                                  new MaterialPageRoute(
                                      builder: (context) =>
                                      new SignUpType()));
                            },
                            child: Text('SIGN UP'),
                            color: AppColor.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: AppColor.blue, width: 2)
                            )
                        )
                    ),

                  ],
                ),
              ),
        ),
      ),
    );
  }


  void checkUser(BuildContext context) {
    bool _user = UserCache.instance.getUserCache();
    if (_user == true) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MainScreens()));
    }
  }

  void createToast() {
    var toast;
    if (toast == null) {
      toast = new Fluttertoast();
      toast = Fluttertoast.showToast(
          msg: "Email or password is wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColor.red,
          textColor: AppColor.white,
          fontSize: 16.0
      );
    }
  }

  Function handleError() {
    createToast();
    print('Email is wrong ');
  }


  Function handleGoogleLoginError() {
  //  createToast();
    print('Email is wrong ');
  }

  Function onErrorGoogle(User userDetails) {
    Navigator.of(context)
        .push(
        new MaterialPageRoute(
            builder: (context) =>
            new SignUpType(userDetails: userDetails,)));
  }

}


