import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mingle/services/Auth.dart';
import 'package:flutter_mingle/pages/create_account.dart';
import 'AuthScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = AuthService();
  PageController _pageController;

  @override
  initState(){
    super.initState();
    auth.checkAuthState(context);

    //Reauthenticate user when app is opened.
    auth.googleSignIn.signInSilently(suppressErrors: false).then((value) => {
      auth.handleSilentSignIn(value)
    });
  }

  @override
  dispose(){
    super.dispose();
    _pageController.dispose();
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
              ),
              RaisedButton(
                child: Text('Create Account'),
                onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount())),
              ),
            ],
          ),
        ),
      );
  }


  @override
  Widget build(BuildContext context) {
    return auth.authState() ? AuthScreen() : buildUnAuthScreen();
  }
}
