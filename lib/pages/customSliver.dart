import 'package:flutter/material.dart';
import 'package:flutter_mingle/services/transition_app_bar.dart';

class CustomSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          TransitionAppBar(
            extent: 250,
            avatar: Text("Rancho"),
            title: Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(5.0))),
              child: Row(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 10.0),
                  child: Icon(Icons.search),
                ),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.black,
                    autofocus: false,
                    style: TextField_Style,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        hintText: "Search",
                        border: InputBorder.none,
                        disabledBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.transparent),
                          borderRadius: new BorderRadius.circular(2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.transparent),
                          borderRadius: new BorderRadius.circular(2),
                        )),
                  ),
                )
              ]),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                    color: Colors.blue,
                    child: ListTile(
                      title: Text("${index}a"),
                    ));
              }, childCount: 25))
        ],
      ),
    );
  }
}
