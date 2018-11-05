import 'package:flutter/material.dart';

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(fontFamily:'quicksand'),
      title: 'Registration Page',
      home: Scaffold(
        appBar: AppBar(
            title: Text('Come Register you cunt')
        ),
        body: Center(
            child: Text('Get ready to get scammed.')
        ),
      ),
    );
  }
}