import 'package:groupleh/app/core/group_member.dart';

class Group {
  String id;
  String image;
  String name;
  List<GroupMember> members;

  Group(this.id, this.image, this.name, this.members);
}
