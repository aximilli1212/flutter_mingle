import 'package:flutter/material.dart';

import 'activity_feed.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController _pageController;

    @override
    void initState() {
    super.initState();
    _pageController = PageController();
    // Add code after super
    }

    @override
    dispose(){
      super.dispose();
      _pageController.dispose();
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
