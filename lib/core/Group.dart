import 'User.dart';

class Group {
  String name;
  DateTime dateCreated = DateTime.now();

  List<User> users;

  Group(this.name, this.dateCreated, this.users);

//  Group deleteGroup





}