import 'package:finalprojecttravelapp/models/database.dart';
import 'package:finalprojecttravelapp/models/databaseuser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:finalprojecttravelapp/models/Countries.dart';
import 'package:finalprojecttravelapp/models/user.dart';
class FavoriteWidget extends StatefulWidget {
  final Countries negara;
  FavoriteWidget({this.negara});
  @override
  createState() => _FavoriteWidgetState();
}

class  _FavoriteWidgetState extends State<FavoriteWidget> {
  static var _isFavorited = false;
  String fav = 'false';
  void _toggleFavorite() {
    setState(() {
      fav = 'true';
      if (_isFavorited) {
        _isFavorited = false;
      } else {
        _isFavorited = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    return MultiProvider(
      providers: [
        Provider<DatabaseService>(
          create: (_) => DatabaseService(),
        ),
        Provider<DatabaseService2>(
          create: (_) => DatabaseService2(),
        )
      ],

          );
        }
  }
