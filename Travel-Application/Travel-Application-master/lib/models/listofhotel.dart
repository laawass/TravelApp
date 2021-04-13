import 'package:finalprojecttravelapp/models/Restaurant.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';
import 'package:finalprojecttravelapp/tabs/Hoteldetails.dart';
class listofhotel extends StatefulWidget {
  final Favhotel hotels;
  listofhotel({this.hotels});

  @override
  _listofhotelState createState() => _listofhotelState();
}

class _listofhotelState extends State<listofhotel> {
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(HotelContent.routeName,arguments: {
                          'imageUrl' : widget.hotels.image,
                          'title' : widget.hotels.name,
                          'description' : widget.hotels.description,
                          'rate': widget.hotels.rate,
                          'price': widget.hotels.price,
                        });
                      },
                      child:(_image!=null)?Image.file(_image,fit:BoxFit.fill,height: 800,width: 1000,):Image.network(widget.hotels.image,fit:BoxFit.fill,height: 800,width: 1000,),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(widget.hotels.name,style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(FontAwesomeIcons.locationArrow,size: 10, color: Colors.white,),
                            SizedBox(width: 5,),
                            Text(widget.hotels.country,style: TextStyle(
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
