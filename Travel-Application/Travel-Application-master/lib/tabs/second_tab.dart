import 'package:finalprojecttravelapp/models/listofRestaurant.dart';
import 'package:finalprojecttravelapp/tabs/restaurantseeall.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finalprojecttravelapp/models/Restaurant.dart';
class SecondTab extends StatefulWidget {
  static const  String routeName = "/about";
  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
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
                              width: 500,
                              child: Image.asset('assets/images/restaurant.jpg',fit: BoxFit.cover,

                              ),
                            ),
                          ),
                        ),
                      ),

                      Positioned(
                        left: 110,
                        top: 60,
                        child: Text(
                          "Best Restaurant",
                          style: new TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient),
                        ),
                      ),
                      Positioned(
                        left: 130,
                        top: 90,
                        child: Text(
                          "in The World ",
                          style: new TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient),
                        ),
                      ),
                      Positioned(
                        left: 140,
                        top: 125,
                        child: Text(
                          "All the challenges and",
                          style: new TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient),
                        ),
                      ),
                      Positioned(
                        left: 160,
                        top: 140,
                        child: Text(
                          "opportunities",
                          style: new TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient),
                        ),
                      ),
                      Positioned(
                        left: 110,
                        top: 155,
                        child: Text(
                          "travel lays at your feet help you",
                          style: new TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient),
                        ),
                      ),
                      Positioned(
                        left: 130,
                        top: 170,
                        child: Text(
                          "discover who you are",
                          style: new TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()..shader = linearGradient),
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
                        'Favorite Restaurants',
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
                              MaterialPageRoute(builder: (context) => Seealltabrestaurant()));
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
                          itemCount: Provider.of<List<FavRestaurant>>(context).length,
                          itemBuilder: (context, index){
                            return listofrestaurant(restaurants: Provider.of<List<FavRestaurant>>(context)[index]);
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
  final Shader linearGradient = LinearGradient(
    colors: <Color>[Colors.black, Colors.black38],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}