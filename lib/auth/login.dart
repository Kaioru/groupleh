import 'package:flutter/material.dart';
import '../routing.dart';



class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      title: 'Login Page',
      home: new Scaffold(
        appBar: AppBar(
          title: Text(
            'Login Page',
          ),
        ),
        body: new Container(
          padding: EdgeInsets.only(top: 48.0, left: 24.0, right: 24.0),
          child: new ListView(
            children: <Widget>[
              new Center(
                child: Text(
                    'Welcome to Login Page'
                ),
              ),
              new SizedBox(height: 34.0,),
              new RaisedButton(
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
