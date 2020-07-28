import 'package:flutter/material.dart';
import 'package:flutter_mingle/widgets/header.dart';

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(context) {
    return Scaffold(
      appBar: header(context, isAppTitle: true, titleText: 'FlutterShare'),
      body: Container(
        color: Colors.red,
        child: Text("sumanguru"),
      ),
    );
  }
}
