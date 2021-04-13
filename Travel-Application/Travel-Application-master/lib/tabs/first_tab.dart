import 'package:finalprojecttravelapp/tabs/hotel1.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:finalprojecttravelapp/models/Countries.dart';
import 'package:finalprojecttravelapp/models/listofcountries.dart';
class FirstTab extends StatefulWidget {
  static const  String routeName = "/about";
  @override
  _FirstTabState createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  var i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
          child: ListView(
          padding: EdgeInsets.all(0),
        children: <Widget>[
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        height:370,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0.0, 2.0),
                              blurRadius: 6.0,
                            ),
                          ],
                        ),
                        child: Hero(
                        tag: 'dash',
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Container(
                            height:MediaQuery.of(context).size.width,
                            child: Image.asset('assets/images/taft-point.jpg',fit: BoxFit.cover,

                            ),
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      left: 215,
                      top: 140,
                      child: Text(
                        "Best Travel",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 215,
                      top: 175,
                      child: Text(
                        "in The World ",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 215,
                      top: 215,
                      child: Text(
                        "All the challenges and",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 215,
                      top: 230,
                      child: Text(
                        "opportunities",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 215,
                      top: 245,
                      child: Text(
                        "travel lays at your feet help you",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 215,
                      top: 260,
                      child: Text(
                        "discover who you are",
                        style: GoogleFonts.lato(
                          textStyle: Theme.of(context).textTheme.display1,
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ],
                ),
              ]
              ),

              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Featured Places',
                          style: TextStyle(
                            shadows: [
                              Shadow(
                                blurRadius: 14.0,
                                color: Colors.grey,
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                            fontSize: 22,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Seealltab()));
                        },
                      child: Text(
                      'See All',
                      style: TextStyle(
                        shadows: [
                          Shadow(
                            blurRadius: 14.0,
                            color: Colors.grey,
                            offset: Offset(5.0, 5.0),
                          ),
                        ],
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                      ),
                     ),
                    ],
                    ),
                  ),
                  FutureBuilder(
                    future: buildText(),
                      builder:(BuildContext context,AsyncSnapshot snapshot){
                         if (snapshot.connectionState != ConnectionState.done) {
                      return CircularProgressIndicator(backgroundColor: Colors.blue);}
                         else{ return Container(
                           height: 255,
                           color: Color.fromRGBO(255, 255, 255, 1),
                           child: ListView.builder(
                             scrollDirection: Axis.horizontal,
                             itemCount: Provider.of<List<Countries>>(context).length,
                            itemBuilder: (context, index){
                            return listofcountry(negara: Provider.of<List<Countries>>(context)[index]);
    },
    ),
                         );
    }
                    }
                    )
                ],
    )
    ],
    ),
    ),

    );
    }



  Future buildText() {
    return new Future.delayed(
        const Duration(seconds: 1), () => print('waiting'));
  }

}