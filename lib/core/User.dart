import 'LearningStyle.dart';
import 'Group.dart';
class User{
  String name;
  int age;
  List<Group> groups;
  LearningStyle preferredLearningStyle;
  String avatarUrl;

  User({this.name, this.age, this.groups, this.preferredLearningStyle, this.avatarUrl});

// Display all groups that user is a part of. Need to learn firebase code
//  User listGroup(){}

// User can edit the group that they are in. Sort of like WhatsApp without admins
//  User editGroup(){}
}

List<User> dummyUsers = [
  new User (
    name: "Daniel",
    age: 18,
    groups: [dummyGroups[0], dummyGroups[1]],
    preferredLearningStyle: LearningStyle.Collaborative,
    avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  ),

  new User (
    name: "Keith",
    age: 20,
    groups: [dummyGroups[0], dummyGroups[1]],
    preferredLearningStyle: LearningStyle.Collaborative,
    avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  ),
  
  new User (
    name: "John",
    age: 18,
    groups: [dummyGroups[0], dummyGroups[1]],
    preferredLearningStyle: LearningStyle.Focused,
    avatarUrl:
      "http://www.usanetwork.com/sites/usanetwork/files/styles/629x720/public/suits_cast_harvey.jpg?itok=fpTOeeBb"),
  ),
  
  new User (
    name: "Marcus",
    age: 21,
    groups: [dummyGroups[0]],
    preferredLearningStyle: LearningStyle.Collaborative
  ),
  
  new User (
    name: "Jo",
    age: 18,
    groups: [dummyGroups[0]],
    preferredLearningStyle: LearningStyle.Collaborative
  )
]
