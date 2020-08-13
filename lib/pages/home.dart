import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mingle/services/Auth.dart';
import 'package:flutter_mingle/pages/create_account.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'AuthScreen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = AuthService();
  PageController _pageController;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final  usersRef = Firestore.instance.collection('users')  ;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final timestamp = DateTime.now();

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


  createUserInFirestore(BuildContext context) async {
    final GoogleSignInAccount user = googleSignIn.currentUser;
    final DocumentSnapshot doc = await usersRef.document(user.id).get();

    if(!doc.exists){
      final username = await Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateAccount()));

      usersRef.document(user.id).setData({
        "id": user.id,
        "username": username,
        "email": user.email,
        "photoUrl": user.photoUrl,
        "displayName": user.displayName,
        "bio": "",
        "timestamp": timestamp,

      });

    }else{
      print(user.id);
      print("User Exits please");
    }
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
