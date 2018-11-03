import 'package:flutter/material.dart';
import 'routing.dart';
import 'auth/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        initialRoute: '/login',
        routes: routes,
    );
  }
}
