
import 'package:finalprojecttravelapp/Authenticator/auth.dart';
import 'package:finalprojecttravelapp/models/databaseuser.dart';
import 'package:finalprojecttravelapp/models/user.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:provider/provider.dart';


class FourthTab extends StatefulWidget {
  @override
  _FourthTabState createState() => _FourthTabState();
}

class _FourthTabState extends State<FourthTab> {
  File _image;
  String _path;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('Image Path $_image');
    });
  }

  Future uploadPic(BuildContext context) async{
    String fileName = basename(_image.path);
    StorageReference firebaseStorageRef = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
    var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
    var printurl = downUrl.toString();
    print("Download URL: $printurl");
    setState(() {
      _path = printurl;
    });
  }
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    final AuthService _auth = AuthService();


    return StreamBuilder<UserData>(
        stream: DatabaseService2(uid: user.uid).userdatastream,
        builder: (context, snapshot) {
          UserData userData = snapshot.data;

          return Scaffold(
            appBar: AppBar(

              title: Text('Your Profile'),
              backgroundColor: Colors.lightBlueAccent,
            ),
            body: Builder(
              builder: (context) =>  Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: 320,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/hotel.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Align(
                            alignment: Alignment.center,
                            child: CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.white,
                              child: ClipOval(
                                child: FutureBuilder(
                                    future: buildText(),
                                    builder:(BuildContext context,AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState !=
                                          ConnectionState.done) {
                                        return CircularProgressIndicator(
                                            backgroundColor: Colors.blue);
                                      }
                                      else {
                                        return Container(
                                          child: SizedBox(
                                            width: 180.0,
                                            height: 180.0,
                                            child: (_image != null) ? Image.file(
                                              _image,
                                              fit: BoxFit.fill,
                                            ) : Image.network(userData.profilepic
                                              ,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 60.0),
                            child: IconButton(
                              icon: Icon(
                                FontAwesomeIcons.camera,
                                size: 30.0,
                              ),
                              onPressed: () {
                                getImage();
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                FutureBuilder(
                                    future: buildText(),
                                    builder:(BuildContext context,AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState !=
                                          ConnectionState.done) {
                                        return CircularProgressIndicator(
                                            backgroundColor: Colors.blue);
                                      }
                                      else {return Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(userData.name,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 30.0,
                                                fontWeight: FontWeight.bold)),
                                      );
                                      }}),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            child: Column(
                              children: <Widget>[
                                FutureBuilder(
                                    future: buildText(),
                                    builder:(BuildContext context,AsyncSnapshot snapshot) {
                                      if (snapshot.connectionState !=
                                          ConnectionState.done) {
                                        return CircularProgressIndicator(
                                            backgroundColor: Colors.blue);
                                      }
                                      else {return Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(userData.email,
                                            style: TextStyle(
                                                color: Colors.blueGrey,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold)),
                                      );
                                      }}),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70.0,
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          color: Color(0xFF404A5C),
                          onPressed: () async {
                            uploadPic(context);
                            await DatabaseService2(uid: user.uid).userData(
                              userData.name,
                              userData.email,
                              _path ?? userData.profilepic,
                            );
                          },
                          child: Text(
                            'Upload',
                            style: TextStyle(color: Colors.white, fontSize: 16.0),
                          ),

                        ),
                        RaisedButton(
                          color: Color(0xFF404A5C),
                          onPressed: () async {
                            await _auth.signOut();
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(color: Colors.white, fontSize: 16.0, ),
                          ),

                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  Future buildText() {
    return new Future.delayed(
        const Duration(seconds: 0), () => print('waiting'));
  }
}



//return StreamProvider<List<Countries>>.value(
//    value: DatabaseService().favorites ,
//    child: Container(
//      color: Colors.blue[900],
//       height: 70.0,
//      child: new Column(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        RaisedButton(
//          color: Colors.redAccent,
//           padding: EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Padding(
//                padding: const EdgeInsets.all(4.0),
//              child: Icon(
//                 Icons.camera,
//                 color: Colors.white,
//                ),
//              ),
//              Padding(
//                 padding: const EdgeInsets.all(2.0),
//                child: Text(
//                   "Logout",
//                   style: TextStyle(
//                     color: Colors.yellow,
//                     fontWeight: FontWeight.bold,
//                  ),
//                ),
//               ),
//             ],
//           ),
//           onPressed: () async {
//  await _auth.signOut();
//  },
//  ),
//  ],
//  ),
//      ),
//  );
// }
// }

