import 'package:flutter/material.dart';
import 'package:groupleh/core/profile.dart';
import 'package:groupleh/main.dart';

class AppState {
  Profile profile;

  AppState(this.profile);
}

class ThemeState {
  static State<MyApp> help;
  static ThemeData theme = ThemeData.dark();
}