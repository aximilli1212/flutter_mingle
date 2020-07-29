import 'package:flutter/material.dart';

import 'customSliver.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              CustomSliver();
            }));
          },
            child: Text('Custom Sliver'),
          )
        ],
      ),
    );
  }
}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result");
  }
}
