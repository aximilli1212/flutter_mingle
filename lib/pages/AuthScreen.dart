import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mingle/pages/profile.dart';
import 'package:flutter_mingle/pages/search.dart';
import 'package:flutter_mingle/pages/timeline.dart';
import 'package:flutter_mingle/pages/upload.dart';
import 'package:flutter_mingle/widgets/header.dart';
import 'package:flutter_mingle/services/Auth.dart';


import 'activity_feed.dart';

class AuthScreen extends StatefulWidget {

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final auth = AuthService();
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

    movePage(int pageIndex){
       _pageController.animateToPage(pageIndex,duration: Duration(milliseconds: 500), curve: Curves.easeInOut );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
       children: <Widget>[
//         Timeline(),
       RaisedButton(
          child: Text('logout'),
         onPressed: auth.logout(),
      ),
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
          BottomNavigationBarItem(icon: Icon(Icons.notifications_active)),
          BottomNavigationBarItem(icon: Icon(Icons.photo_camera,size: 35,)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle)),
        ],
      ),
    );
  }
}
