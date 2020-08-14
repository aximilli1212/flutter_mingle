import 'package:flutter/material.dart';
import 'package:flutter_mingle/widgets/header.dart';
import 'package:flutter_mingle/services/Auth.dart';

import 'create_account.dart';
class ActivityFeed extends StatefulWidget {
  @override
  _ActivityFeedState createState() => _ActivityFeedState();
}


class _ActivityFeedState extends State<ActivityFeed> {
  @override
  Widget build(BuildContext context) {
    return Text('Activity Feed');
  }
}

class ActivityFeedItem extends StatelessWidget {
  final auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(child:
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            child: Text('logout'),
            onPressed: auth.logout(),
          ),
          RaisedButton(
            child: Text('Create Account'),
            onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateAccount())),
          ),
        ],
      ),);
  }
}
