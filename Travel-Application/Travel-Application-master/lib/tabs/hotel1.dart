import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finalprojecttravelapp/tabs/Hoteldetails.dart';
import 'package:finalprojecttravelapp/models/Countries.dart';
class Seealltab extends StatefulWidget {
  static const routeName = '/detailpage';
  final Countries negara;
  Seealltab({this.negara});
  @override
  _SeealltabState createState() => new _SeealltabState();
}

class _SeealltabState extends State<Seealltab> {


  File _image;
  String searchString;

  @override

  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    return new Scaffold(
        body: Container(
            child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                  ),
                  TextField(
                    onChanged: (value) {
                      setState(() {
                        searchString = value.toLowerCase();
                      });
                    },
                    decoration: InputDecoration(
                        labelText: "Search",
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                  ),
                  Expanded(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: (searchString == null || searchString.trim() == "")? Firestore.instance.collection("FavoriteCountry").snapshots():
                          Firestore.instance.collection("FavoriteCountry").where("searchIndex",arrayContains: searchString).snapshots(),
                          builder: (context, snapshot) {
                            if(snapshot.hasError)
                              return Text('Error: ${snapshot.error}');
                            switch(snapshot.connectionState){
                              case ConnectionState.waiting:
                                return Center(child: CircularProgressIndicator());
                              default:
                                return new ListView(
                                  children: snapshot.data.documents.map((DocumentSnapshot document){
                                    return new  Container(
                                        decoration: BoxDecoration(
                                          color: Colors.yellow,
                                          borderRadius: BorderRadius.circular(19),
                                        ),
                                        margin: EdgeInsets.all((10)),
                                        width: 210,
                                        height: 200,
                                        child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              Positioned(
                                                bottom: 15,
                                                child: Container(
                                                  margin: EdgeInsets.all((10)),
                                                  height: 100,
                                                  width: 400,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(15)
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Column(
                                                      mainAxisAlignment:MainAxisAlignment.end,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                    ),
                                                  ),
                                                ),

                                              ),Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:BorderRadius.circular(30.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:  Colors.black,
                                                        offset:  Offset(1.0, 1.0),
                                                        blurRadius: 6.0,
                                                      )
                                                    ],
                                                  ),
                                                  child: Stack(
                                                      children: <Widget>[
                                                        ClipRRect(
                                                          borderRadius: BorderRadius.circular(20.0),
                                                          child: GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(context).pushNamed(HotelContent.routeName,arguments: {
                                                                'imageUrl' : document['image'].toString(),
                                                                'title' : document['city'].toString(),
                                                                'description' : document['description'].toString()
                                                              });
                                                            },
                                                            child:(_image!=null)?Image.file(_image,height: 100,width: 100,):Image.network(document['image'],fit:BoxFit.fill,height: 300,width: 1000,),
                                                          ),
                                                        ),
                                                        Positioned(
                                                            left: 10,
                                                            bottom: 10,
                                                            child: Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: <Widget>[
                                                                  Text(document['city'],style: TextStyle(
                                                                    color: Colors.white,
                                                                    fontSize: 24,
                                                                    fontWeight: FontWeight.bold,
                                                                    letterSpacing: 1.2,
                                                                  ),
                                                                  ),
                                                                  Row(
                                                                    children: <Widget>[
                                                                      Icon(FontAwesomeIcons.locationArrow,size: 10, color: Colors.white,),
                                                                      SizedBox(width: 5,),
                                                                      Text(document['place'],style: TextStyle(
                                                                        color: Colors.white,
                                                                        fontSize: 14,
                                                                        fontWeight: FontWeight.bold,
                                                                        letterSpacing: 1.2,
                                                                      ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ]))]))]));
                                  }).toList(),
                                );}}))
                ])));

  }
}
