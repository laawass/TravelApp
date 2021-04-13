import 'package:firebase_auth/firebase_auth.dart';
import 'package:finalprojecttravelapp/models/user.dart';
import 'package:finalprojecttravelapp/models/databaseuser.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFireBaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;
  }
  Stream<User> get user{
    return _auth.onAuthStateChanged.map(_userFromFireBaseUser);
  }
  Future signinAnon() async {
    try{
    AuthResult result = await _auth.signInAnonymously();
    FirebaseUser user = result.user;
    return _userFromFireBaseUser(user);
    }catch(e) {
      print(e.toString());
      return null;
    }
  }
  Future signinEmail(String emails, String passwords) async {
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: emails, password: passwords);
      FirebaseUser user = result.user;
      return _userFromFireBaseUser(user);
    }catch(e){
      print(e.toString());
      return null;
    }
  }
  Future registerEmail(String emails, String passwords,String names) async {
    try{
AuthResult result = await _auth.createUserWithEmailAndPassword(email: emails, password: passwords);
FirebaseUser user = result.user;
await DatabaseService2(uid:user.uid).userData(names,emails,'');
return _userFromFireBaseUser(user);
    }catch(e){
     print(e.toString());
     return null;
    }
  }
  Future signOut() async {
    try{
      return await _auth.signOut();
    }catch(e){
      print(e.toString());
      return null;
    }
  }
}