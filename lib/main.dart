import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:groupleh/profile/lepage.dart';
import 'package:groupleh/profile/model/Planets.dart';
import 'package:groupleh/profile/model/Planet.dart';


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
      home: DetailPage(PlanetDao.planets[0]),
    );
  }
}
