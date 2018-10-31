import 'package:flutter/material.dart';
import 'routing';
import 'auth/login.dart';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home:new LoginPage(),
        initialRoute: '/login',
        routes: routes
    );
  }
}
