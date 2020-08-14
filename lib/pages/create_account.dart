import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mingle/widgets/header.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String username;

  void submit(){
    final form = _formKey.currentState;

    if(form.validate()){
      form.save();

      SnackBar snackBar = SnackBar(content: Text("Welcome $username"));
      _scaffoldKey.currentState.showSnackBar(snackBar);

      Timer(Duration(seconds: 2), (){
        Navigator.pop(context, username);
      });
    }
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: header(context, titleText: "Profile Setup"),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Text("Create a username", style: TextStyle(
                      fontSize: 25.0,
                    ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    child: Form(
                      key: _formKey,
                      child: TextFormField(
                        autovalidate: true,
                        validator: (val){
                          if(val.trim().length < 3 || val.isEmpty){
                            return "username is too short";
                          }else if(val.trim().length > 20){
                            return "username too long";
                          }
                          else
                            {
                            return null;
                          }
                        },
                        onSaved: (val) => username = val,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Username",
                          labelStyle: TextStyle(fontSize: 15.0),
                          hintText: "Must be at least 3 characters",
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: submit,
                  child: Container(
                    width: 200.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text('Create Username', style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),)),
                    ),
                  ),
                )

              ],
            ),
        )]
      ),
    );
  }
}
