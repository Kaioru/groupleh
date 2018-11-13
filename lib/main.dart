import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter/services.dart';
import 'package:groupleh/app/app.dart';
=======
import 'routing.dart';
import 'auth/login.dart';
>>>>>>> dev-ui

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
<<<<<<< HEAD
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
      home: App(),
=======
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

        initialRoute: '/login',
        routes: routes,
>>>>>>> dev-ui
    );
  }
}
