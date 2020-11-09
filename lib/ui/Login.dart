import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/network/NetWork.dart';


class _Login extends State<Login>{
 // var email,password;
  var network=NetWork();
  //var utils= Utils();
  var subscription;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  var _email;
  var _password;

  final GlobalKey<FormState> _formkey= GlobalKey<FormState>();

  var decoration= new  InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.greenAccent, width: 5.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.red, width: 5.0),
      ));

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    subscription.dispose();
    super.dispose();
  }


  @override
  initState()  {
    super.initState();

     subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {});


  }

  // Be sure to cancel subscription after you are done

  Widget _buildName(){
    return TextFormField(
      decoration: InputDecoration(labelText: "Email",
           border: OutlineInputBorder(
               borderSide: BorderSide(color: Colors.black12, width: 2.0)),
           focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12, width: 2.0)),
           enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12, width: 2.0))

    ),
    validator: (String value){
        if ( value.isEmpty){
          return "Name is required";
        }
    },onSaved: (String value){
        _email=value;
      },
    );
  }

  Widget _buildPassword(){
       return TextFormField(
         decoration: InputDecoration(labelText: "password",
             border: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.black12, width: 2.0)),
             focusedBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.black12, width: 2.0)),
             enabledBorder: OutlineInputBorder(
                 borderSide: BorderSide(color: Colors.black12, width: 2.0))

         ),

       validator: (String value){
           if ( value.isEmpty){
             return "password is required";
           }
       },
         onSaved: (String value){
           _password = value;
         },
       );
     }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: Column(
          children:<Widget>[
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(2.0),
              padding: EdgeInsets.all(12.0),
              alignment: Alignment.topLeft,
              child: Text("Login",style: TextStyle(fontSize: 30,color: Colors.black),),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.all(2.0),
              padding: EdgeInsets.all(12.0),
              alignment: Alignment.topLeft,
              child:Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget> [
                     SizedBox(height: 100),
                    _buildName(),
                     SizedBox(height: 50),
                    _buildPassword()
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: new BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10)
              ),
              margin: EdgeInsets.all(30.0),
              child:ButtonTheme(
                minWidth: 400.0,
                height: 50.0,
                child: RaisedButton(
                 onPressed: () {


                  if (_formkey.currentState.validate()){

                    print('Doneeeee');


                  return ;
                  }
                  _formkey.currentState.save();

              },
                  child: Text("Sign in",style:TextStyle(color: Colors.white),),
                  color: Colors.black,
                )
                ,
              ),
            ),
            SizedBox(height: 4),
          ]
      ),
    );
  }

  Future<bool> _checkInternet() async {
     var connectivityResult = await (Connectivity().checkConnectivity());
     if (connectivityResult == ConnectivityResult.mobile ||
         connectivityResult == ConnectivityResult.wifi) {
       print("aaaaaaaa");
       Future.value(true);
     } else {
       print("kkkkkkkkk");
       Future.value(false);
     }
   }
}

class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Login();
  }
}
