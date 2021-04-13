import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finalprojecttravelapp/models/user.dart';


class DatabaseService2 {

  final String uid;
  DatabaseService2({this.uid});
  final CollectionReference userdata = Firestore.instance.collection('User');

  Future userData(String name,String Email,String profilepic) async {
    return await userdata.document(uid).setData({
      'name': name,
      'Email': Email,
      'profilepic':profilepic,
    });
  }
  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: snapshot.data['uid'],
      name: snapshot.data['name'],
      email: snapshot.data['Email'],
      profilepic: snapshot.data['profilepic']
    );
  }
  Stream<UserData> get userdatastream{
    return userdata.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
