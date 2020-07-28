import 'package:flutter/material.dart';

import 'activity_feed.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  PageController _pageController;
  int pageIndex = 0;

    @override
    void initState() {
    super.initState();
    _pageController = PageController();
    this.pageIndex = 1;
    // Add code after super
    }

    @override
    dispose(){
      super.dispose();
      _pageController.dispose();
    }

    onPageChanged(int pageIndex){
      setState((){
        this.pageIndex = pageIndex;
      });
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
        controller: _pageController,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
