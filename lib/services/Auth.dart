import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_mingle/pages/create_account.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

final usersRef = Firestore.instance.collection('users');


class AuthService {

  bool isAuth = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final  usersRef = Firestore.instance.collection('users')  ;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final timestamp = DateTime.now();



  authState(){
    return isAuth;
  }

  login(){
    googleSignIn.signIn();
  }

  logout(){
    googleSignIn.signOut();
  }

  checkAuthState(BuildContext context){
    googleSignIn.onCurrentUserChanged.listen((account){
      if(account != null){
        print('User signed in!: $account');
        createUserInFirestore(context);

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
      isAuth = true;
      print('isAuth State $isAuth');
      return googleAuth;
    } catch (e) {
      print(e.toString());
      print('Signin Error =================>');
      isAuth = false;

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

  createUserInFirestore(BuildContext context) async {
    final GoogleSignInAccount user = googleSignIn.currentUser;
    final DocumentSnapshot doc = await usersRef.document(user.id).get();

    if(!doc.exists){

      usersRef.document(user.id).setData({
        "id": user.id,
        "username": "share user",
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


}