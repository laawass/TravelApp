import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/explorer-optimize.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 50,
        ),
      ),
    );
  }
}
