import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mingle/models/user.dart';
import 'package:flutter_mingle/widgets/progress.dart';
import 'package:flutter_svg/svg.dart';
final usersRef = Firestore.instance.collection('users');

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}


Container buildNoContent(BuildContext context){
  final Orientation orientation = MediaQuery.of(context).orientation;
   return Container(
      child:Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
              SvgPicture.asset('assets/images/search.svg', height: orientation == Orientation.portrait?  300.0:200.0),
            Text(
              "Find Users",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
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
 Future<QuerySnapshot> searchResultsFuture;

 handleSearch(String query) {
   Future<QuerySnapshot> users = usersRef.
   where("displayName", isGreaterThanOrEqualTo: query)
       .getDocuments();
   setState((){
     searchResultsFuture = users;
   });
 }

 FutureBuilder buildSearchResults(){
   return FutureBuilder(
     future: searchResultsFuture,
     builder: (context, snapshot){
       if(!snapshot.hasData){
         return circularProgress();
       }
       List<Text> searchResults = [];

       snapshot.data.documents.forEach((doc){
         User user = User.fromDocument(doc);
         searchResults.add(Text(user.username));
       });

       return ListView(
         children: searchResults,
       );
     },
   );
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
       onFieldSubmitted: handleSearch,
     ),
   );
 }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildSearchField(),
      body: searchResultsFuture == null?
      buildNoContent(context):
      buildSearchResults(),
    );
  }
}



class UserResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("User Result");
  }
}

