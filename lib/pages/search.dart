import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'customSliver.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

AppBar buildSearchField() {
  return AppBar(
    backgroundColor: Colors.white,
    title: TextFormField(
      decoration: InputDecoration(
        hintText: "Search for a user ... ",
        filled: true,
        prefixIcon: Icon(
          Icons.account_box,
          size: 28.0,
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.clear),
          onPressed: ()=>{
            print('cleared'),
          },
        )
      ),
    ),
  );
}

Container buildNoContent(){
   return Container(
      child:Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
              SvgPicture.asset('assets/images/search.svg', height: 300),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 60.0,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
      )
   );
}




class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: buildNoContent(),
    );
  }

}

class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result");
  }
}
