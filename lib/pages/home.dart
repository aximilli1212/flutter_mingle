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
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end   : Alignment.bottomLeft,
              colors: [Colors.teal, Colors.purple]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Flutter Share', style: TextStyle(
                fontFamily: 'Signatra',
                fontSize: 90.0,
              )),
              GestureDetector(
                child: Container(
                  width: 260.0,
                  height: 60.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/google_signin_button.png'),
                        fit: BoxFit.cover,
                    ),

                  ),
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
