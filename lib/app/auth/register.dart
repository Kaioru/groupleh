import 'package:flutter/material.dart';
import 'package:groupleh/app/auth/login.dart';

class Register extends StatefulWidget {
  @override
  _Register createState() => new _Register();
}

class _Register extends State<Register> {
  final _formKey = GlobalKey<_Register>();

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
                        decoration: new InputDecoration(
                          labelText: "Email",
                        ),
                        keyboardType: TextInputType.emailAddress),
                    TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text),
                    TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Password again",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text),
                    ButtonBar(children: <Widget>[
                      RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Login()));
                        },
                        child: Text('Cancel'),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        child: Text('Register'),
                      )
                    ])
                  ],
                ))));
  }
}
