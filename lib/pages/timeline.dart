import 'package:flutter/material.dart';
import 'package:flutter_mingle/widgets/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final userRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  @override
  void initState() {
    // TODO: implement initState
    getUsers();
    super.initState();
  }

  getUsers(){
     userRef.getDocuments().then((QuerySnapshot snapshot){
         snapshot.documents.forEach((DocumentSnapshot doc){
            print(doc.documentID);
         });
     });
  }

  getUserById(){
    final String id = "XDAENsJBnxKzEE5VSZCe";
    userRef.document(id).get().then((DocumentSnapshot doc){
        print(doc.data);
        print(doc.documentID);
    });
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true, titleText: 'FlutterShare'),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Text('Sumanguru'),
          Divider(height: 12, color: Colors.grey),
            Container(
              width: 300.0,
              height: 300.0,
              color: Colors.orange,
            ),
            RaisedButton(
              onPressed: getUsers,
              child: Text('Hit it up'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)
              ),
              onPressed: getUserById,
              child: Text('Get User by ID.'),
            )

      ],
        ),
      ),
    );
  }
}
