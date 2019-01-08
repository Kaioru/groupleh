import 'package:groupleh/core/group.dart';
import 'package:groupleh/core/achievement.dart';

class Profile {
  final String name;
  final String desc;
  final int coins;

  final List<Group> groups;
  final List<Achievement> achievements;

  Profile({this.name, this.desc, this.coins, this.groups, this.achievements});
}