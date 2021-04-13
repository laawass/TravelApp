import 'package:finalprojecttravelapp/Authenticator/Authenticate.dart';
import 'package:finalprojecttravelapp/tabs/MainPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null){
      return Authenticate();
    }else{
      return MainPage();
    }
  }
}
