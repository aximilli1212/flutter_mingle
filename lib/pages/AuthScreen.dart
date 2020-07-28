import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mingle/pages/profile.dart';
import 'package:flutter_mingle/pages/upload.dart';

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

    movePage(){

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
        physics: NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: pageIndex,
        onTap: movePage,
        activeColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot)),
        ],
      ),
    );
  }
}
