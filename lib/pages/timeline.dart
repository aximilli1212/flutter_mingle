import 'package:flutter/material.dart';
import 'package:flutter_mingle/widgets/header.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_mingle/widgets/progress.dart';

final usersRef = Firestore.instance.collection('users');

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {

  @override
  void initState() {
    // TODO: implement initState
    creatUser();
    getUsers();
    super.initState();
  }

  creatUser(){
//    usersRef.add({  // for automatic id
//      "username": "Alipopo Mangao",
//      "postsCount": 5,
//      "isAdmin": false,
//    });

  usersRef.document('main-string').setData({
    "username": "Okponglu Harvard",
    "postsCount": 0,
    "isAdmin": false,
  });
  }

  updateUser(){
    usersRef.document('main-string').updateData({
      "username": "Okponglu Harvard",
      "postsCount": 0,
      "isAdmin": false,
    });
  }

  deleteUser(){
    usersRef.document('main-string').delete();
  }

  getUsers(){
     usersRef.getDocuments().then((QuerySnapshot snapshot){
         snapshot.documents.forEach((DocumentSnapshot doc){
            print(doc.documentID);
         });
     });
  }

  getAdminUsers() async{
    final QuerySnapshot snapshot = await usersRef.where("isAdmin", isEqualTo: true).getDocuments();
    snapshot.documents.forEach((DocumentSnapshot doc){
      print(doc.data);
    });
  }

  getCompoundQuery() async{
    print('we getting..');
    final QuerySnapshot snapshot = await usersRef
        .limit(2)
        .where("isAdmin", isEqualTo: true)
        .where("isAdmin", isEqualTo: true)
//        .orderBy("username", descending: true)
        .getDocuments();
    if(snapshot != null){
      snapshot.documents.forEach((DocumentSnapshot doc){
        print(doc.data);
      });
    }else{
      print(snapshot);
    }

  }

  getUserById() async {
    final String id = "XDAENsJBnxKzEE5VSZCe";
     final DocumentSnapshot doc  = await usersRef.document(id).get();
        print(doc.data);
        print(doc.documentID);
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true, titleText: 'FlutterShare'),
      body: FutureBuilder<QuerySnapshot>(
        future: usersRef.getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return circularProgress();
          }

          final List<Text> children = snapshot.data.documents
              .map((doc)=> Text(doc['username'])).toList();

          return Container(
            child: ListView(
              children: children,
            ),
          );
        },
      ),
    );
  }
}
