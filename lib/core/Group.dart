import 'User.dart';

class Group {
  String name;
  DateTime dateCreated = DateTime.now();

  List<User> users;

  Group({this.name, this.dateCreated, this.users});

//  Group deleteGroup

}

List<Group> dummyGroups = [
  new Group(
    name: "I love Flutter",
    dateCreated: DateTime.now(),
    users: [dummyUsers[0], dummyUsers[1], dummyUsers[2], dummyUsers[3], dummyUsers[4]]
  ),

  new Group(
    name: "I have not done anything",
    dateCreated: new DateTime(2018,1,30),
    users: [dummyUsers[0], dummyUsers[1], dummyUsers[2]]
  )
]