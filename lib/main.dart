import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupleh/app/app.dart';
import 'package:groupleh/app/auth/login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  static ThemeData theme = ThemeData.dark();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return new MaterialApp(
      title: 'GroupLeh',
      theme: theme,
      home: Login(),
    );
  }
}
