import 'package:flutter/material.dart';

class ButtonImaged extends RaisedButton{

  Widget ButtonImagedd(String title,Icon icon ,Function,Color colorHex,double fontsize){
     RaisedButton.icon(

         onPressed:Function,
         color:color,
         label: Text(title,
           style: TextStyle(
               color:colorHex
               , fontSize: fontsize),
         ),
         icon:icon,
         shape:RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(8.0),
             side: BorderSide(color: Color(0xff29B2FE))
         )

     );
  }

}