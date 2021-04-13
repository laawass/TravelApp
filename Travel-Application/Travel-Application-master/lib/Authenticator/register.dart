import 'package:flutter/material.dart';
import 'package:finalprojecttravelapp/Authenticator/auth.dart';
import 'package:finalprojecttravelapp/Shared/loading.dart';
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  String name = '';
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
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                        child: Text('Travel Application',
                            style: TextStyle(
                                fontSize: 50.0, fontWeight: FontWeight.bold)),
                      ),
                      SizedBox(height: 40),
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
                              hintText: "Name",
                              hintStyle: TextStyle(color: Colors.redAccent),
                            ),
                            validator: (val) => val.isEmpty? 'Enter Your Name':null,
                            onChanged: (val){
                              setState(()=> name = val);
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
                                focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(25.7),
                        ),
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
                            setState(() => loading = true);
                            dynamic result = await _auth.registerEmail(email,password,name,);
                            print(name);
                            print(email);
                            print(password);
                            if(result == null ){
                              setState(() {
                                error = 'Please input correctly';
                                loading = false;
                              });
                            }
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            letterSpacing: 3,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () async{
                          widget.toggleView();
                        },
                        child: new Padding(
                          padding: new EdgeInsets.all(10.0),
                          child: Text(
                            'Already have account? Sign in',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              letterSpacing: 3,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14),
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

