import 'package:finalprojecttravelapp/tabs/Hoteldetails.dart';
import 'package:flutter/material.dart';
import 'package:finalprojecttravelapp/models/Countries.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

class listofcountry extends StatefulWidget {
  final Countries negara;
  listofcountry({this.negara});

  @override
  _listofcountryState createState() => _listofcountryState();
}

class _listofcountryState extends State<listofcountry> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(19),
        ),
        margin: EdgeInsets.all((10)),
        width: 310,
        height: 100,

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
            ),
            Container(
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
                  Hero(
                    tag: widget.negara.image,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(HotelContent.routeName,arguments: {
                            'imageUrl' : widget.negara.image,
                            'title' : widget.negara.country,
                            'description' : widget.negara.description,
                            'price' : '',
                            'rate' : '',
                          });
                        },
                      child:(_image!=null)?Image.file(_image,fit:BoxFit.fill,height: 800,width: 1000,):Image.network(widget.negara.image,fit:BoxFit.fill,height: 800,width: 1000,),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.negara.country,style: TextStyle(
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
                            Text(widget.negara.place,style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.2,
                            ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
    );
  }
}
