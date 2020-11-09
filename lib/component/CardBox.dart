import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardBox extends Container {
  CardBox(
      Color backgroundColor,
      double padding,
      Widget child,
      {double opacity = 0.10,double radius=10}
      ) : super(
    padding: EdgeInsets.all(padding),
    decoration: new BoxDecoration(
        color: backgroundColor,
        borderRadius: new BorderRadius.all(Radius.circular(radius)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(opacity),
              spreadRadius: 3,
              blurRadius: 3,
              offset: Offset(0, 3))
        ]),
    child: child,
  );
}