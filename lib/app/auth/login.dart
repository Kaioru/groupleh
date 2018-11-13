import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groupleh/app/app.dart';
import 'package:groupleh/app/auth/register.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => new _Login();
}

class _Login extends State<Login> {
  final _formKey = GlobalKey<_Login>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<FirebaseUser> _handleSignIn() async {
    return await _auth.signInWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
            key: _formKey,
            child: Container(
                padding: EdgeInsets.only(left: 24.0, right: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FlutterLogo(size: 120.0),
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
                    ButtonBar(children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                        child: Text('Register'),
                      ),
                      RaisedButton(
                        onPressed: () async => await _handleSignIn()
                            .then((user) => print(user))
                            .catchError((e) => print(e)),
                        child: Text('Login'),
                      )
                    ])
                  ],
                ))));
  }
}
