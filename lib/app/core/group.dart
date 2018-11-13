import 'package:groupleh/app/core/group_member.dart';

class Group {
  int id;
  String name;
  List<GroupMember> members;

  Group(this.id, this.name, this.members);
}