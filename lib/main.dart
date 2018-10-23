import 'package:flutter/material.dart';
import 'routing';
void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'quicksand'),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome Home',
          ),
        ),
        body: Center()
        ),
      initialRoute: '/login',
      routes: routes
    );
}
