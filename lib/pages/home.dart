import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  bool isAuth = false;


  Widget buildAuthScreen(){

  }

  Scaffold buildUnAuthScreen(){
      return Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Flutter Share', style: TextStyle()),
              GestureDetector(
                child: Container(
                  width: 260.0,
                  height: 60.0,
                  child: ,
                ),
              )
            ],
          ),
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return isAuth? buildAuthScreen() : buildUnAuthScreen();
  }
}
