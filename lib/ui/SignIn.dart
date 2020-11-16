import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/Validation.dart';
import 'package:flutterpractice/cache/TokenCache.dart';
import 'package:flutterpractice/component/CardBox.dart';
import 'package:flutterpractice/google/GoogleSignIn.dart';
import 'package:flutterpractice/network/Network.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'MainScreens.dart';

class SignIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SignIn();
  }

}

class _SignIn extends State<SignIn>{

  var validation = Validation();
  var network    = Network();
  var gSignIn    = GoogleLogin();
  final _formKey = GlobalKey<FormState>();
  var email ,password;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();


  // FirebaseAuth _firebaseAuth= FirebaseAuth.instance;
  // GoogleSignIn _googleSignIn= new GoogleSignIn();
  //
  // Future<FirebaseUser> signIn(BuildContext context) async {
  //
  //   Scaffold.of(context).showSnackBar(new SnackBar(
  //     content: new Text('Sign in'),
  //   ));
  //
  //   final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  //   final GoogleSignInAuthentication googleAuth =await googleUser.authentication;
  //
  //   final AuthCredential credential = GoogleAuthProvider.getCredential(
  //     accessToken: googleAuth.accessToken,
  //     idToken: googleAuth.idToken,
  //   );
  //
  //   UserCredential userDetails = await _firebaseAuth.signInWithCredential(credential);
  //   ProviderDetails providerInfo = new ProviderDetails(userDetails.user.uid);
  //
  //   List<ProviderDetails> providerData = new List<ProviderDetails>();
  //   providerData.add(providerInfo);
  //
  //   UserDetails details = new UserDetails(
  //     userDetails.user.uid,
  //     userDetails.user.displayName,
  //     userDetails.user.photoUrl,
  //     userDetails.user.email,
  //     providerData,
  //   );
  //
  //   print("sssss"+details.userName);
  //   print('sssssss'+details.userEmail);
  //   // Navigator.push(
  //   //   context,
  //   //   new MaterialPageRoute(
  //   //     //builder: (context) => new ProfileScreen(detailsUser: details),
  //   //   ),
  //   // );
  //   return userDetails.user;
  // }



  @override
  void initState()   {
    // TODO: implement initState
    super.initState();
    checkUser(context);

  }


    @override
    Widget build(BuildContext context) {
      // TODO: implement build

            return  SafeArea(
              child: Scaffold(
                resizeToAvoidBottomPadding: false,
                body: Builder(
                  builder: (context) => Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                          child: Image.asset("images/login.png", height: 120)
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 33, right: 33),
                        child: Divider(
                            thickness: 4,
                            color: Color(0xff29B2FE)
                        ),
                      ),
                      Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.only(left: 20),
                          child: Text("LOGIN", style: TextStyle(color: Color(0xff405A7B),
                              fontSize: 32,
                              fontWeight: FontWeight.bold),)),
                      Container(
                        margin: EdgeInsets.only(top: 17, left: 20, right: 10),
                        child: CardBox(Colors.white, 10, Container(
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
                                          if (!validation.isEmail(value)){
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
                                      SizedBox(height: 20),
                                      TextFormField(
                                        // The validator receives the text that the user has entered.
                                        validator: (value) {
                                          if (value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          if (!validation.validateStructure(value)){
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
                                        padding: EdgeInsets.only(top: 18, right: 16),
                                        child: Text(
                                          "Forget Password",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Color(0xff405A7B)),
                                        ),
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 55,
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

                                                await prefs.setBool('isUser', true);
                                                print(value.token);
                                                TokenCache.instance.setAccessToken(value.token);


                                                if (value.user.type=="serviceProvider") {

                                                } else if (value.user.type=="customer") {
                                                  //go to client home
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                      new MaterialPageRoute(
                                                          builder: (context) =>
                                                          new MainScreen()));
                                                }
                                              }).catchError(handleError());
                                            }
                                          },
                                          child: Text('Login'),
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
                                              if (_formKey.currentState.validate()) {
                                                //   network.login(email, password);
                                                // If the form is valid, display a snackbar. In the real world,
                                                // you'd often call a server or save the information in a database.
                                              }
                                            },
                                            color: Colors.white,

                                            label: Text(
                                              'Sign in with Facebook',
                                              style: TextStyle(
                                                  color: Color(0xff3B5998), fontSize: 16),
                                            ),
                                            icon: Image.asset(
                                              "images/facebook.png", height: 30,
                                              width: 30,)
                                            ,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                side: BorderSide(color: Color(0xff29B2FE))
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

                                              gSignIn.signIn(context);
                                            },
                                            color: Colors.white,
                                            label: Text(
                                              'Sign in with Google',
                                              style: TextStyle(
                                                  color: Color(0xffDD4B39), fontSize: 16),
                                            ),
                                            icon: Image.asset(
                                              "images/google.png", height: 30,
                                              width: 30,),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(8.0),
                                                side: BorderSide(color: Color(0xff29B2FE))
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
                          height: 55,
                          margin: EdgeInsets.only(
                              right: 10, left: 10, top: 10),
                          child:
                          RaisedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, otherwise false.

                              },
                              child: Text('SIGN UP'),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                  side: BorderSide(color: Color(0xff29B2FE), width: 2)
                              )
                          )
                      ),

                    ],
                  ),
                ),
              ),
            );


    }
        // child: SafeArea(
        //   child: Scaffold(
        //     resizeToAvoidBottomPadding: false,
        //     body: Builder(
        //       builder: (context) => Column(
        //         children: [
        //           SizedBox(height: 10),
        //           Container(
        //               child: Image.asset("images/login.png", height: 120)
        //           ),
        //           Container(
        //             padding: EdgeInsets.only(left: 33, right: 33),
        //             child: Divider(
        //                 thickness: 4,
        //                 color: Color(0xff29B2FE)
        //             ),
        //           ),
        //           Container(
        //               alignment: Alignment.topLeft,
        //               padding: EdgeInsets.only(left: 20),
        //               child: Text("LOGIN", style: TextStyle(color: Color(0xff405A7B),
        //                   fontSize: 32,
        //                   fontWeight: FontWeight.bold),)),
        //           Container(
        //             margin: EdgeInsets.only(top: 17, left: 20, right: 10),
        //             child: CardBox(Colors.white, 10, Container(
        //               child: Column(
        //                 children: [
        //                   Form(
        //                       key: _formKey,
        //                       child: Column(
        //                         children: [
        //                           TextFormField(
        //                             // The validator receives the text that the user has entered.
        //                             validator: (value) {
        //                               //bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
        //
        //
        //                               if (value.isEmpty) {
        //                                 return 'Please enter some text';
        //                               }
        //                                if (!validation.isEmail(value)){
        //                                  return 'Invalid Email';
        //                                }
        //
        //                               return null;
        //                             },
        //                            controller: emailController
        //
        //                             ,
        //                             decoration: new InputDecoration(
        //                               hintText: 'email',
        //                               prefixIcon: Icon(Icons.email_outlined),
        //                             ),
        //                           ),
        //                           SizedBox(height: 20),
        //                           TextFormField(
        //                             // The validator receives the text that the user has entered.
        //                             validator: (value) {
        //                               if (value.isEmpty) {
        //                                 return 'Please enter some text';
        //                               }
        //                               if (!validation.validateStructure(value)){
        //                                 return "password must contain lower and upper character";
        //                               }
        //                               return null;
        //                             },
        //                             controller: passwordController,
        //                             decoration: new InputDecoration(
        //                               hintText: 'password',
        //                               prefixIcon: Icon(Icons.lock),
        //                             ),
        //                           ),
        //                           Container(
        //                             alignment: Alignment.topRight,
        //                             padding: EdgeInsets.only(top: 18, right: 16),
        //                             child: Text(
        //                               "Forget Password",
        //                               style: TextStyle(
        //                                   fontWeight: FontWeight.bold,
        //                                   fontSize: 16,
        //                                   color: Color(0xff405A7B)),
        //                             ),
        //                           ),
        //                           Container(
        //                             width: double.infinity,
        //                             height: 55,
        //                             margin: EdgeInsets.only(
        //                                 right: 10, left: 10, top: 20),
        //                             child:
        //                             RaisedButton(
        //                               onPressed: () async {
        //                                 // Validate returns true if the form is valid, otherwise false.
        //                                 if (_formKey.currentState.validate()) {
        //                                   // If the form is valid, display a snackbar. In the real world,
        //                                   // you'd often call a server or save the information in a database.
        //
        //                                   await network
        //                                         .login(emailController.text,
        //                                             passwordController.text)
        //                                         .then((value) async {
        //
        //                                       SharedPreferences prefs =
        //                                           await SharedPreferences
        //                                               .getInstance();
        //
        //                                       await prefs.setBool('isUser', true);
        //                                       print(value.token);
        //                                       TokenCache.instance.setAccessToken(value.token);
        //
        //
        //                                       if (value.user.type=="serviceProvider") {
        //
        //                                       } else if (value.user.type=="customer") {
        //                                         //go to client home
        //                                         Navigator.of(context)
        //                                             .pushReplacement(
        //                                             new MaterialPageRoute(
        //                                                 builder: (context) =>
        //                                                 new MainScreen()));
        //                                       }
        //                                     }).catchError(handleError());
        //                                   }
        //                                 },
        //                               child: Text('Login'),
        //                               color: Color(0xff29B2FE),
        //                             ),
        //                           ),
        //                           Container(
        //                             width: double.infinity,
        //                             height: 56,
        //                             margin: EdgeInsets.only(
        //                                 right: 10, left: 10, top: 10),
        //                             child: RaisedButton.icon(
        //                                 onPressed: () {
        //                                   // Validate returns true if the form is valid, otherwise false.
        //                                   if (_formKey.currentState.validate()) {
        //                                  //   network.login(email, password);
        //                                     // If the form is valid, display a snackbar. In the real world,
        //                                     // you'd often call a server or save the information in a database.
        //                                   }
        //                                 },
        //                                 color: Colors.white,
        //
        //                                 label: Text(
        //                                   'Sign in with Facebook',
        //                                   style: TextStyle(
        //                                       color: Color(0xff3B5998), fontSize: 16),
        //                                 ),
        //                                 icon: Image.asset(
        //                                   "images/facebook.png", height: 30,
        //                                   width: 30,)
        //                                 ,
        //                                 shape: RoundedRectangleBorder(
        //                                     borderRadius: BorderRadius.circular(8.0),
        //                                     side: BorderSide(color: Color(0xff29B2FE))
        //                                 )
        //                             )
        //                             ,
        //                           ),
        //                           Container(
        //                             width: double.infinity,
        //                             height: 56,
        //                             margin: EdgeInsets.only(
        //                                 right: 10, left: 10, top: 10),
        //                             child: RaisedButton.icon(
        //                                 onPressed: () {
        //                                   // Validate returns true if the form is valid, otherwise false.
        //                                   // if (_formKey.currentState.validate()) {
        //                                   //   // If the form is valid, display a snackbar. In the real world,
        //                                   //   // you'd often call a server or save the information in a database.
        //                                   // }
        //
        //                                   _signIn(context);
        //                                 },
        //                                 color: Colors.white,
        //                                 label: Text(
        //                                   'Sign in with Google',
        //                                   style: TextStyle(
        //                                       color: Color(0xffDD4B39), fontSize: 16),
        //                                 ),
        //                                 icon: Image.asset(
        //                                   "images/google.png", height: 30,
        //                                   width: 30,),
        //                                 shape: RoundedRectangleBorder(
        //                                     borderRadius: BorderRadius.circular(8.0),
        //                                     side: BorderSide(color: Color(0xff29B2FE))
        //                                 )
        //                             ),
        //
        //                           ),
        //                         ],
        //                       )
        //                   )
        //                 ],),
        //             )),),
        //           Container(
        //               width: double.infinity,
        //               height: 55,
        //               margin: EdgeInsets.only(
        //                   right: 10, left: 10, top: 10),
        //               child:
        //               RaisedButton(
        //                   onPressed: () {
        //                     // Validate returns true if the form is valid, otherwise false.
        //
        //                   },
        //                   child: Text('SIGN UP'),
        //                   color: Colors.white,
        //                   shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(8.0),
        //                       side: BorderSide(color: Color(0xff29B2FE), width: 2)
        //                   )
        //               )
        //           ),
        //
        //         ],
        //       ),
        //     ),
        //   ),
        // ),



  Future checkUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _user = (prefs.getBool('isUser') ?? false);

    print("isUser" + _user.toString());
    print('asdasdasdadasd');
    if (_user == true) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new MainScreen()));
    } else {
      // await prefs.setBool('isUser', true);
      // bool _seen = (prefs.getBool('isUser'));
      // print("oooo2"+_seen.toString());
    }
  }

  void createToast(){
    var toast;
    if (toast==null){
          toast = new Fluttertoast();
          toast= Fluttertoast.showToast(
              msg: "Email or password is wrong",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0
          );
    }


  }

  Function handleError() {
    createToast();
    print('Email is wrong ');
  }
}
// class UserDetails {
//   final String providerDetails;
//   final String userName;
//   final String photoUrl;
//   final String userEmail;
//   final List<ProviderDetails> providerData;
//
//   UserDetails(this.providerDetails,this.userName, this.photoUrl,this.userEmail, this.providerData);
// }
//
// class ProviderDetails {
//   ProviderDetails(this.providerDetails);
//   final String providerDetails;
// }
