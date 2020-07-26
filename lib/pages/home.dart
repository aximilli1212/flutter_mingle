import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mingle/services/Auth.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = AuthService();

  @override
  initState(){
    super.initState();
    auth.checkAuthState();

    //Reauthenticate user when app is opened.
    auth.googleSignIn.signInSilently(suppressErrors: false).then((value) => {
      auth.handleSilentSignIn(value)
    });
  }

  Widget buildAuthScreen(){
     return Scaffold(
       backgroundColor: Colors.grey,
       body: Container(
         child: Text('I am Authenticated'),
       ),
     );
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
//                onTap: ()=> login(),
                onTap: (){
                  auth.signInWithGoogle();
                },
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
    return auth.authState() ? buildAuthScreen() : buildUnAuthScreen();
  }
}
