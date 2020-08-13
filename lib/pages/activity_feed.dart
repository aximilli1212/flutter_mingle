import 'package:flutter/material.dart';
import 'package:flutter_mingle/widgets/header.dart';
import 'package:flutter_mingle/services/Auth.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(child:
      Column(
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
