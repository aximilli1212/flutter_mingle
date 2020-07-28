import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {


    @override
    void initState() {
    super.initState();
    // Add code after super
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
       children: <Widget>[
         Timeline(),
         ActivityFeed(),
         Upload(),
         Search(),
         Profile(),
       ],
      ),
    );
  }
}
