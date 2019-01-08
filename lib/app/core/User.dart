import 'LearningStyle.dart';
import 'Group.dart';
class User{
  final String name;
  final int age;
  final List<Group> groups;
  final LearningStyle preferredLearningStyle;
  final String avatarUrl;

  User({this.name, this.age, this.groups, this.preferredLearningStyle, this.avatarUrl});
}