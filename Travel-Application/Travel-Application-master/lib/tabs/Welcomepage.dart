import 'package:flutter/material.dart';
import 'package:finalprojecttravelapp/Authenticator/auth.dart';
import 'package:finalprojecttravelapp/Shared/loading.dart';
class SplashScreen extends StatefulWidget {
  final Function toggleView;
  SplashScreen({this.toggleView});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/explorer-optimize.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 20, 40, 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                child: Text('Travel Application',
                    style: TextStyle(
                        fontSize: 50.0, fontWeight: FontWeight.bold)),
              ),
              Form(
                key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(25.7),
                    ),
                    child: TextFormField(
                        style: TextStyle(fontSize: 20.0,color: Colors.white,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.redAccent),
                        ),
                        validator: (val) => val.isEmpty? 'Enter an Email Address':null,
                        onChanged: (val){
                          setState(()=> email = val);
                        }
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(25.7),
                    ),
                    child: TextFormField(
                        style: TextStyle(fontSize: 20.0,color: Colors.white,),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          fillColor: Colors.white,
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.redAccent),
                        ),
                        validator: (val) => val.length < 6? 'Your password is too short' :null,
                        obscureText: true,
                        onChanged: (val){
                          setState(()=> password = val);
                        }
                    ),
                  ),
                  SizedBox(height: 50),
                  RaisedButton(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    color: Colors.redAccent,
                    onPressed: () async{
                      if(_formKey.currentState.validate()) {
                        dynamic result = await _auth.signinEmail(email,password);
                        setState(() => loading = true);
                        print(email);
                        print(password);
                        if(result == null ){
                          setState(() {
                            error = "Gak bisa login";
                            loading = false;
                          });

                        }
                        //dynamic result = await _auth.signinAnon();
                        //if (result == null){
                        //  print('Check your Internet Connnection');
                        // }else {
                        //   print('Signed In');
                        //   print(result.uid);
                         }
                     },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        letterSpacing: 3,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () async{
                      widget.toggleView();
                    },
                    child: new Padding(
                      padding: new EdgeInsets.all(10.0),
                      child: Text(
                        'Dont have account? Sign up',
                        style: TextStyle(
                          fontSize: 13.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          letterSpacing: 3,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    error,
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  )
                ],
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}