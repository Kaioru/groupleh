import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Login Page',
      home: new Scaffold(
        appbar: AppBar(
          title: Text(
            'Login Page',
          ),
        ),
        body: new Container(
          padding: EdgeInsets.only(top: 48.0, left: 24.0, right: 24.0),
          child: new ListView(
            children: <Widget>[
              Center(
                child: Text(
                    'Welcome to Login Page'
                ),
              ),
              SizedBox(height: 34.0,),
              RaisedButton(
                  color: Colors.lightBlueAccent,
                  child: Text('Go to Homepage'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
