import 'package:flutter/material.dart';
import 'package:flutter_mingle/pages/customSliver.dart';
import 'package:flutter_mingle/widgets/header.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context, isAppTitle: false, titleText: 'Profile'),
      body: Container(
        child: Column(
          children: <Widget>[
            RaisedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
               return CustomSliver();
              }));
            },
              child: Text('Custom Sliver'),
            )
          ],
        ),
      ),
    );
  }
}
