import 'package:flutter/material.dart';
import 'routing';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        initialRoute: '/login',
        routes: routes
    );
  }
}
