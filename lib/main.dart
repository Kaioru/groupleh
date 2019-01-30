import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupleh/app/app_state.dart';
import 'package:groupleh/app/auth/login.dart';

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
    ThemeState.help = this;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GroupLeh',
      theme: ThemeState.theme,
      home: Login(),
    );
  }
}
