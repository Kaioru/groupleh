import 'LearningStyle.dart';
import 'Group.dart';
class User{
  String name;
  int age;
  List<Group> groups;
  LearningStyle preferredLearningStyle;

  User(this.name, this.age, this.preferredLearningStyle);

// Display all groups that user is a part of. Need to learn firebase code
//  User listGroup(){}

// User can edit the group that they are in. Sort of like WhatsApp without admins
//  User editGroup(){}
}
