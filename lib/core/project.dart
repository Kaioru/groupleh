import 'package:groupleh/core/profile.dart';

class Project {
  final String name;
  final String desc;
  final List<String> tags;
  final List<String> applicants;

  final Profile leader;
  final List<Profile> members;

  Project({this.name, this.desc, this.tags, this.applicants, this.leader, this.members});
}
