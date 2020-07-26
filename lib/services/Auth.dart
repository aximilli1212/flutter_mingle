import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthService {

  bool isAuth = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();



  authState(){
    return isAuth;
  }

  login(){
    googleSignIn.signIn();
  }

  logout(){
    googleSignIn.signOut();
  }

  checkAuthState(){
    googleSignIn.onCurrentUserChanged.listen((account){
      if(account != null){
        print('User signed in!: $account');
          isAuth = true;
      }else{
          isAuth = false;
      }
    }, onError: (err){
      print("Error Sign in: $err");
    });
  }

  Future signInWithGoogle() async {
    print('start Google Sign In');
    try {

      GoogleSignIn goog = new GoogleSignIn(scopes: ["email"]);

      GoogleSignInAccount googleUser = await goog.signIn();
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      print(googleAuth);
      print('Signin Good =================>');
      return googleAuth;
    } catch (e) {
      print(e.toString());
      print('Signin Error =================>');

      return null;
    }
  }

  handleSilentSignIn(account){
    if(account != null){
      print('User signed in!: $account');
        isAuth = true;
    }else{
        isAuth = false;
    }
  }


}