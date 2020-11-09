import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/component/CardBox.dart';

class SignIn extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return _SignIn();
  }

}

class _SignIn extends State<SignIn>{

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Column(
          children: [
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.all(20),
              child: Image.asset("images/login.png",height:120)
            ),
            Container(
              padding: EdgeInsets.only(left: 33,right: 33),
              child: Divider(
                thickness: 4,
                  color: Colors.cyan
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 20),
                child: Text("LOGIN",style: TextStyle(color:Color(0xff405A7B),fontSize: 30,fontWeight: FontWeight.bold),)),
            Container(
              margin: EdgeInsets.only(top: 20,left: 20,right: 10),
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
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
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
                                  return null;
                                },
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
                                child: RaisedButton(
                                  onPressed: () {
                                    // Validate returns true if the form is valid, otherwise false.
                                    if (_formKey.currentState.validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.

                                      Scaffold.of(context).showSnackBar(
                                          SnackBar(
                                              content:
                                                  Text('Processing Data')));
                                    }
                                  },
                                  child: Text('Login'),
                                  color:Color(0xff29B2FE),

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
                                   icon: Image.asset("images/facebook.png",height: 30,width: 30,)
                                    ,
                                    shape:RoundedRectangleBorder(
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
                                    if (_formKey.currentState.validate()) {
                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                    }
                                  },
                                  color: Colors.white,
                                  label: Text(
                                    'Sign in with Google',
                                    style: TextStyle(
                                        color: Color(0xffDD4B39), fontSize: 16),
                                  ),
                                   icon:Image.asset("images/google.png",height: 30,width: 30,)
                                    ,
                                    shape:RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8.0),
                                        side: BorderSide(color: Color(0xff29B2FE))
                                    )
                                ),
                              )
                            ],
                          )

                    )




                  ],
                ),
              )),),
            SizedBox(height: 20,),
            Container(
            child: RaisedButton(
              onPressed: () {
                // Validate returns true if the form is valid, otherwise false.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                }
              },
              color: Colors.white,
              child: Text(
                'SIGN UP',
                style: TextStyle(color: Color(0xff29B2FE), fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );


  }


}