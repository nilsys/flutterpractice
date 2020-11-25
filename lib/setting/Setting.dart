import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterpractice/component/CardBox.dart';
import 'package:flutterpractice/core/AppColor.dart';

class Setting extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _Setting();
  }

}

class _Setting extends State {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Setting"),),
      body: Container(
        color: AppColor.offWhite,
        child: Column(
          children: [
            Container(
                child: Image.asset("images/setting.png", height:MediaQuery.of(context).size.height/5
                  ,width: MediaQuery.of(context).size.width,)
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top:16 ),
              child: CardBox(
              AppColor.white,4,Container(
               child: ListTile(leading: Image.asset('images/language.png'),title: Text("language")),
            )
            ),),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top:16 ),
              child: CardBox(
                  AppColor.white,4,Container(
                child: ListTile(leading: Image.asset('images/policy.png'),title: Text("Privacy Policy")),
              )
              ),),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top:16 ),
              child: CardBox(
                  AppColor.white,4,Container(
                child: ListTile(leading: Image.asset('images/terms.png'),title: Text("Terms & Condition")),
              )
              ),),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top:16 ),
              child: CardBox(
                  AppColor.white,4,Container(
                child: ListTile(leading: Image.asset('images/contactus.png'),title: Text("Contact Us")),
              )
              ),),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20,top:16 ),
              child: Row(children: [
                Expanded(
                 child:  Container(
                   child: CardBox(
                       AppColor.white,4,Container(
                     child: ListTile(leading: Image.asset('images/terms.png'),title: Text("Rate App",style: TextStyle(fontSize: 14))),
                   )
                   ),),
                ),
                SizedBox(width: 8,),
                Expanded(
                  child:  Container(
                    child: CardBox(
                        AppColor.white,4,Container(
                      child: ListTile(leading: Image.asset('images/terms.png'),title: Text("Share App",style: TextStyle(fontSize: 14),)),
                    )
                    ),),
                )




              ],)

              ,)
          ],
        ),
      ),
    );
  }

}