import 'package:flutter/widgets.dart';

class Project {
  final String id;
  final String name;
  final String desc;
  final String image;
  final List<String> tags;
  final List<String> applicants;

  final String leader;
  final List<String> members;

  Project(
      {this.id,
      this.name,
      this.desc,
      this.image,
      this.tags,
      this.applicants,
      this.leader,
      this.members});
}
