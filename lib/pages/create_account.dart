import 'package:flutter/material.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  @override
  Widget build(BuildContext parentContext) {
    return Container(
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
                  child: TextFormField(
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
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius:
                ),
              ),
            )

          ],
        ),
    );
  }
}
