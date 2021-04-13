import 'package:finalprojecttravelapp/Authenticator/auth.dart';
import 'package:finalprojecttravelapp/Wrapper.dart';
import 'package:finalprojecttravelapp/models/user.dart';
import 'package:finalprojecttravelapp/tabs/Hoteldetails.dart';
import 'package:finalprojecttravelapp/tabs/hotel1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Schyler',
        primaryColor: Colors.blue.withOpacity(1),
    accentColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    ),
    home: StreamProvider<User>.value(
      value: AuthService().user,
        child: Wrapper()),
      routes: {
        HotelContent.routeName: (context) => HotelContent(),
      },
   );
    }
  }

