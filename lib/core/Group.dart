import 'package:flutter/widgets.dart';
import 'package:groupleh/core/profile.dart';

class Group {
  final String id;
  final String name;
  final DateTime date;

  final Image image;

  final List<Profile> members;

  Group({this.id, this.name, this.date, this.image, this.members});
}
