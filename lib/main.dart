import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupleh/app/auth/login.dart';
import 'package:groupleh/app/matchmaking/matchmaking.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  static ThemeData theme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GroupLeh',
      theme: theme,
      home: Login(),
    );
  }
}
