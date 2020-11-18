
import 'package:firebase_auth/firebase_auth.dart' as fa;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Model/login/SignInSocial.dart' as ls;
import 'package:flutterpractice/Model/login/SignInSocial.dart';
import 'package:flutterpractice/Validation.dart';
import 'package:flutterpractice/auth/AuthRepository.dart';
import 'package:flutterpractice/cache/TokenCache.dart';
import 'package:flutterpractice/cache/UserCache.dart';
import 'package:flutterpractice/component/CardBox.dart';
import 'package:flutterpractice/google/GoogleSignIn.dart';
import 'package:flutterpractice/network/Network.dart';
import 'package:flutterpractice/ui/MainScreens.dart';

class  SignUpForm extends StatefulWidget{
  fa.User userDetails;
  String type;
  ls.User user;


  SignUpForm({Key key, this.userDetails,this.type,this.user}):super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _SignUpForm(userDetails,type,user);
  }

}

class _SignUpForm extends State<SignUpForm>{

  var validation = Validation();
  var formkey=GlobalKey<FormState>();
  var gSignIn = GoogleLogin();
  var auth = AuthRepository();
  fa.User userDetails;
  ls.User user;
  String type;

  TextEditingController nameController     = new TextEditingController();
  TextEditingController emailController    = new TextEditingController();
  TextEditingController phoneController    = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  _SignUpForm(fa.User userDetails,String type,ls.User user){
    this.type=type;
    this.userDetails=userDetails;
    this.user = user;

    print("registerrr   "+this.user.email);
    print("registerr  "+this.user.name);
    //fill data when sign in google
    if (userDetails!=null){
      nameController.text= userDetails.displayName ;
      emailController.text= userDetails.email ;
    }else if (user != null){
      nameController.text= user.name ;
      emailController.text= user.email ;
    }




  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
              Container(
              padding: EdgeInsets.only(top: 20),
              child: Image.asset('images/signup.png', height: 205, ),
            ),
              Container(
            margin: EdgeInsets.only(right: 33,left: 33),
            child: Divider(
            thickness: 4,
            color: Color(0xff29B2FE),
            ),
            ),
              Container(
                margin: EdgeInsets.all(20),
                child: CardBox(
                Colors.white,10, Form(
                  key:formkey ,
                  child:Column(
                    children: [
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Your name';
                          }

                          return null;
                        },
                        controller: nameController,
                        decoration: new InputDecoration(
                          hintText: 'Name',
                          prefixIcon: Icon(Icons.account_circle_sharp),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Your email';
                          }
                          if (!validation.isEmail(value)) {
                            return "invalid email";
                          }
                          return null;
                        },
                        controller: emailController,
                        decoration: new InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Your Mobile';
                          }
                          // if (!validation.validateStructure(value)) {
                          //   return "invalid Mobile";
                          // }
                          return null;
                        },
                        controller: phoneController,
                        decoration: new InputDecoration(
                          hintText: 'Mobile',
                          prefixIcon: Icon(Icons.phone_android),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        // The validator receives the text that the user has entered.
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter Your password';
                          }
                          if (!validation.validateStructure(value)) {
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
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        height: 55,
                        margin: EdgeInsets.only(
                            right: 10, left: 10, top: 20),
                        child:
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                          ),
                          onPressed: () async {
                            // Validate returns true if the form is valid, otherwise false.
                            if (formkey.currentState.validate()) {
                              // If the form is valid, display a snackbar. In the real world,
                              // you'd often call a server or save the information in a database.

                    if (userDetails==null) {
                      await auth.signUp("register",
                          {
                            'Accept':'application/json',
                            'Content-Type': 'application/json',
                          },

                          {
                            'name': nameController.text,
                            'email': emailController.text,
                            "password": passwordController.text,
                            "type": 'customer',
                            "phone": phoneController.text,
                            "lat": "159123",
                            'lng': "147852"
                          }

                      ).then((value) async {
                        //  await prefs.setBool('isUser', true);
                        //   print(value.token);
                        TokenCache.instance.setAccessToken(
                            value.token);
                        UserCache.instance.setUserCache(true);
                        UserCache.instance.setUserType(value.user.type);

                        if (value.user.type == "serviceProvider") {
                          //continue registeration

                        } else if (value.user.type == "customer") {
                          //go to client home
                          Navigator.of(context)
                              .pushReplacement(
                              new MaterialPageRoute(
                                  builder: (context) =>
                                  new MainScreens()));
                        }
                      }).catchError((Object error) {});

                      ////////////////
                    }else {
                      await auth.registerSocial("social-register",
                          {
                            'Accept':'application/json',
                            'Content-Type': 'application/json',
                          },
                          {
                            'name' : nameController.text,
                            'email': emailController.text,
                            "password": passwordController.text,
                            "type" : type,
                            "phone": phoneController.text,
                            "social_type"  : "google",
                            'social_id'    : userDetails.uid,
                          }

                      ).then((value) async {
                        //  await prefs.setBool('isUser', true);
                        //   print(value.token);
                        TokenCache.instance.setAccessToken(
                            value.token);
                        UserCache.instance.setUserCache(true);
                        UserCache.instance.setUserType(value.user.type);

                        if (value.user.type == "serviceProvider") {
                          //continue registeration

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




                            }
                          },
                          child: Text('Sign Up'),
                          color: Color(0xff29B2FE),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 56,
                        margin: EdgeInsets.only(
                            right: 10, left: 10, top: 10),
                        child: RaisedButton.icon(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              if (formkey.currentState
                                  .validate()) {
                                //   network.login(email, password);
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                              }
                            },
                            color: Colors.white,

                            label: Text(
                              'Sign in with Facebook',
                              style: TextStyle(
                                  color: Color(0xff3B5998),
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
                        child: RaisedButton.icon(
                            onPressed: () {
                              // Validate returns true if the form is valid, otherwise false.
                              // if (_formKey.currentState.validate()) {
                              //   // If the form is valid, display a snackbar. In the real world,
                              //   // you'd often call a server or save the information in a database.
                              // }

                              gSignIn.signIn(context).then((value) {
                                if (value.uid != null) {
                                  auth.signInSocial("social-login",
                                      {
                                        'Accept':'application/json',
                                        'Content-Type': 'application/json',
                                      },
                                      {
                                    'social_id' : value.uid,
                                    'social_type' : "google",
                                  }).then((value) {
                                    Navigator.of(context)
                                        .pushReplacement(
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                            new MainScreens()));
                                  });

                                }
                              }
                              ).catchError(handleGoogleLoginError);
                            },
                            color: Colors.white,
                            label: Text(
                              'Sign in with Google',
                              style: TextStyle(
                                  color: Color(0xffDD4B39),
                                  fontSize: 16),
                            ),
                            icon: Image.asset(
                              "images/google.png", height: 30,
                              width: 30,),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0),
                                side: BorderSide(
                                    color: Color(0xff29B2FE))
                            )
                        ),

                      ),
                    ],
                  )
                ),
              ),)
          ],
        ),
      ),
    );
  }


  Object handleError() {
   // createToast();
    print('Email is wrong ');
  }


  Function handleGoogleLoginError() {
    //  createToast();
    print('Email is wrong ');
  }
}