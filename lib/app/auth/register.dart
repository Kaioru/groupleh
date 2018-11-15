import 'package:flutter/material.dart';
import 'package:groupleh/app/auth/login.dart';
import 'package:groupleh/app/app.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => new _Register();
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();

  Future<FirebaseUser> _handleCreateUser() async {
    return await _auth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("GroupLeh",
                        style: TextStyle(
                            fontSize: 48.0, fontWeight: FontWeight.bold)),
                    TextFormField(
                        controller: _emailController,
                        validator: (val) {
                          Pattern pattern =
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                          RegExp regex = new RegExp(pattern);
                          if (!regex.hasMatch(val))
                            return 'Please enter a valid email!';
                          else
                            return null;
                        },
                        decoration: new InputDecoration(
                          labelText: "Email",
                        ),
                        keyboardType: TextInputType.emailAddress),
                    TextFormField(
                        controller: _passwordController,
                        decoration: new InputDecoration(
                          labelText: "Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text),
                    TextFormField(
                        controller: _password2Controller,
                        validator: (val) {
                          if (_passwordController.text !=
                              _password2Controller.text)
                            return 'Passwords do not match!';
                          else
                            return null;
                        },
                        decoration: new InputDecoration(
                          labelText: "Password again",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text),
                    ButtonBar(children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => Login()));
                        },
                        child: Text('Cancel'),
                      ),
                      RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await _handleCreateUser().then((user) {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          App(AppState(user))));
                            }).catchError((e) => _scaffoldKey.currentState
                                .showSnackBar(SnackBar(
                                    content: Text("Failed to register!"))));
                          }
                        },
                        child: Text('Register'),
                      )
                    ])
                  ],
                ))));
  }
}
