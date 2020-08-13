import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle=false, String titleText, bool removeBackButton}) {
  return AppBar(
    automaticallyImplyLeading: removeBackButton? true: false,
    title: Text(isAppTitle? 'FlutterMingle': titleText, style: TextStyle(
      color: Colors.white,
      fontFamily: isAppTitle? "Signatra": "",
      fontSize: isAppTitle? 50.0: 22.0,
    ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
