import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  bool isAuth = false;
//
//  login(){
//    googleSignIn.signIn();
//  }

  logout(){
        googleSignIn.signOut();
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
      setState((){
        isAuth = true;
      });
    }else{
      setState((){
        isAuth = false;
      });
    }
  }
//
//  @override
//  initState(){
//    super.initState();
//    googleSignIn.onCurrentUserChanged.listen((account){
//      if(account != null){
//        print('User signed in!: $account');
//        setState((){
//          isAuth = true;
//        });
//      }else{
//         setState((){
//           isAuth = false;
//         });
//      }
//    }, onError: (err){
//      print("Error Sign in: $err");
//    });
//
//    googleSignIn.signInSilently(suppressErrors: false).then((value) => {
//      handleSilentSignIn(value)
//    });
//
//
//  }



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
                  signInWithGoogle();
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
    return isAuth? buildAuthScreen() : buildUnAuthScreen();
  }
}
