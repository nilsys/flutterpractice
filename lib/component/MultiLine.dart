
import 'package:flutter/cupertino.dart';

class MultiLine extends Container{

 // MultiLine(String text,int Maxline, int widthOfLine);


  MultiLine(String text,
      int maxline,
      double widthOfLine,
      Color textColor
      )
      : super(
      width: widthOfLine,
      child:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${text}",
            overflow: TextOverflow.ellipsis,
            maxLines: maxline ,
            style: TextStyle( color:  textColor,),),
        ],
      )


  );




}