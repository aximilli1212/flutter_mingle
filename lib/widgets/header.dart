import 'package:flutter/material.dart';

AppBar header(context) {
  return AppBar(
    title: Text('FlutterMingle', style: TextStyle(
      color: Colors.white,
      fontFamily: "Signatra",
      fontSize: 5.0,
    ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
