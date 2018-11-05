import 'package:flutter/material.dart';
import '../routing.dart';


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login Page',

      home: new Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomPadding: false,
        body: new Container(
          padding: EdgeInsets.only(top: 48.0, left: 24.0, right: 24.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: 80.0,
              ),
              new Container(
                padding: const EdgeInsets.all(40.0),
                child: new Form(
                  autovalidate: true,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Email", fillColor: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      new TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Enter Password",
                        ),
                        obscureText: true,
                        keyboardType: TextInputType.text,
                      ),
                      new Padding(
                        padding: const EdgeInsets.only(top: 60.0),
                      ),
                      new RaisedButton(
                          color: Colors.green,
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: new Text('Login'),
                          onPressed: (){
                            Navigator.pushNamed(context, '/');
                          }),
                      new RaisedButton(
                          color: Colors.green,
                          splashColor: Colors.teal,
                          textColor: Colors.white,
                          child: new Text('Register'),
                          onPressed: (){
                            Navigator.pushNamed(context, '/register');
                          })
                    ],
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
