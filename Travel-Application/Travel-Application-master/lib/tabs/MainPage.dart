import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:finalprojecttravelapp/models/databaserestaurant.dart';
import 'package:finalprojecttravelapp/tabs/first_tab.dart';
import 'package:finalprojecttravelapp/tabs/second_tab.dart';
import 'package:flutter/material.dart';
import 'package:finalprojecttravelapp/models/database.dart';
import 'package:provider/provider.dart';
import 'package:finalprojecttravelapp/models/Countries.dart';
import 'package:finalprojecttravelapp/tabs/third_tab.dart';
import 'package:finalprojecttravelapp/models/Restaurant.dart';
import 'package:finalprojecttravelapp/tabs/fourth_tab.dart';
import 'package:finalprojecttravelapp/tabs/fifthTab.dart';

class MainPage extends StatefulWidget {

  static const  String routeName = "/navigator";
  @override
    MainPage({Key key}) : super(key: key);
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedTab = 0;
  final _pageOptions = [
    FirstTab(),
    SecondTab(),
    ThirdTab(),
    FourthTab(),
    FifthTab(),
  ];

  @override
  Widget build(BuildContext context) {
  return MultiProvider(
      providers: [
    StreamProvider<List<Countries>>.value(value: DatabaseService().favorites),
      StreamProvider<List<FavRestaurant>>.value(value: DatabaseServiceRestaurant().favorites),
        StreamProvider<List<Favhotel>>.value(value: DatabaseServiceHotel().favorites),
          ],
          child: Scaffold(
            body: _pageOptions[_selectedTab],
            bottomNavigationBar:  CurvedNavigationBar(
              color: Colors.indigoAccent,
              backgroundColor: Colors.white,
              buttonBackgroundColor: Colors.blueAccent,
              height: 50,
              onTap: (int index) {
                setState(() {
                  _selectedTab = index;
                });
              },

              items: [
                Icon(Icons.airplanemode_active,size: 30,color: Colors.white,),
                Icon(Icons.restaurant,size: 30,color: Colors.white,),
                Icon(Icons.hotel,size: 30,color: Colors.white,),
                Icon(Icons.person,size: 30,color: Colors.white,),
                Icon(Icons.person,size: 30,color: Colors.white,),
              ],
            ),
      ),
     // ),
          );

      }
  }

