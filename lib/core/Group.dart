import 'User.dart';

class Group {
  final String name;
  final DateTime dateCreated;

  final List<User> users;
  final String avatarUrl;
  Group({this.name, this.dateCreated, this.users, this.avatarUrl});

//  Group deleteGroup

}

List<Group> dummyGroups = [
  new Group(
    name: "I love Flutter",
    dateCreated: DateTime.now(),
    users: [dummyUsers[0], dummyUsers[1], dummyUsers[2], dummyUsers[3], dummyUsers[4]],
    avatarUrl: 
    "https://banner2.kisspng.com/20180710/xui/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3adae62.4180922415312688197114.jpg",
  ),

  new Group(
    name: "I have not done anything",
    dateCreated: new DateTime(2018,1,30),
    users: [dummyUsers[0], dummyUsers[1], dummyUsers[2]],
    avatarUrl: 
    "https://banner2.kisspng.com/20180710/xui/kisspng-dart-programming-language-flutter-object-oriented-flutter-logo-5b454ed3adae62.4180922415312688197114.jpg",
  )
];